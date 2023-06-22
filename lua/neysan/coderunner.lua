vim.api.nvim_exec("highlight MyHighlight guibg=#282c34 guifg=#abb2bf", false)

local filetype_commands = {
    python = "python3",
    lua = "lua",
    c = "gcc %s -o out && ./out && rm out",
    cpp = "g++ %s -o out && ./out && rm out",
    -- add other filetypes and their corresponding run commands here
}

-- Define a local variable to store the output window ID and buffer number
local output_win_buf = { winid = nil, bufnr = nil }

vim.api.nvim_create_user_command("Run", function()
    -- If a previous output window and buffer exists, close and delete them
    if output_win_buf.winid and output_win_buf.bufnr then
        if vim.api.nvim_win_is_valid(output_win_buf.winid) then
            vim.api.nvim_win_close(output_win_buf.winid, true)
        end
        if vim.api.nvim_buf_is_valid(output_win_buf.bufnr) then
            vim.api.nvim_buf_delete(output_win_buf.bufnr, { force = true })
        end
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
    local command = filetype_commands[filetype]
    if not command then
        print("Unsupported filetype: " .. filetype)
        return
    end

    local filename = vim.api.nvim_buf_get_name(bufnr)
    command = command .. " " .. filename

    -- Calculate the size of the new split
    local height = vim.api.nvim_get_option("lines")
    local split_size = math.floor(height / 3)

    -- Create a new horizontal split
    vim.cmd(split_size .. "new")

    -- Get the window ID of the new split
    local output_win = vim.api.nvim_get_current_win()

    -- Create a new terminal buffer in the current window and run the command
    vim.fn.termopen(command)

    -- Get the buffer number of the new terminal buffer
    local output_bufnr = vim.api.nvim_win_get_buf(output_win)

    vim.api.nvim_win_set_option(output_win, 'winhighlight', 'Normal:MyHighlight')

    -- q to close the output window
    vim.api.nvim_buf_set_keymap(output_bufnr, 't', 'q', '<C-\\><C-n>:q<CR>', {noremap = true, silent = true})

    -- Save the new output window ID and buffer number
    output_win_buf.winid = output_win
    output_win_buf.bufnr = output_bufnr
end, {})
