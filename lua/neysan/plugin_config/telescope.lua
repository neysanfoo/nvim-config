local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },

		mappings = {
			i = {
				["<Down>"] = actions.cycle_history_next,
				["<Up>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-d>"] = actions.delete_buffer,
			},
			n = {
				["dd"] = actions.delete_buffer,
			},
		},
	},
})

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
