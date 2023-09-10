local Input = require("nui.input")
local event = require("nui.utils.autocmd").event
local Terminal  = require('toggleterm.terminal').Terminal

-- Global table to store file-command pairs
local file_commands = {}

-- Current state of the command
local command_state = {
    running = false,
    output = nil,
    terminal = nil
}

-- Function to bind command to a file
function bind_command_to_file()
    local input_component
    input_component = Input({
        relative = "editor",
        position = "50%",
        size = { width = 50 },
        border = {
            style = "rounded",
            padding = { top = 1, bottom = 1, left = 2, right = 2 },
            text = { top = "Enter a command to bind", top_align = "center" },
        },
        win_options = { winhighlight = "Normal:Normal,FloatBorder:Normal" },
    }, {
        prompt = "> ",
        default_value = "",
        on_submit = function(value)
            local file = vim.fn.expand("%:p")
            file_commands[file] = value
            print('Command "' .. value .. '" has been bound to ' .. file)
            input_component:unmount() -- Close the input component after the command is submitted
        end,
        on_close = function() end,
    })

    input_component:mount()
    input_component:map("n", "<Esc>", function()
        input_component:unmount()
    end, { noremap = true })
    input_component:on(event.BufLeave, function()
        input_component:unmount()
    end)
end

-- Command to bind a command to a file
vim.api.nvim_command("command! BindCommand lua bind_command_to_file()")

-- Function to run command associated with a file
function run_command_for_file()
    local file = vim.fn.expand("%:p")
    local command = file_commands[file]
    if command == nil then
        print("No command bound for this file")
        return
    end

    -- Create a new terminal with a unique ID
    command_state.terminal = Terminal:new({
      cmd = command,
      close_on_exit = false,
    })
    command_state.terminal:toggle()
end

-- Command to run command for a file
vim.api.nvim_command("command! RunCommand lua run_command_for_file()")

-- Command to close the terminal
vim.api.nvim_command("command! CloseTerminal lua close_terminal()")

-- Function to close the terminal
function close_terminal()
    -- Only try to close the terminal if it's open
    if command_state.terminal ~= nil then
        -- Toggle the terminal off
        command_state.terminal:toggle()
        command_state.terminal = nil
    end
end
