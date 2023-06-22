local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

-- OR setup with some options
nvim_tree.setup({
		sort_by = "case_sensitive",
	filters = {
		dotfiles = false,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	renderer = {
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		icons = {
			hint = "H",
			info = "I",
			warning = "W",
			error = "E",
		},
	},
	view = {
		width = 30,
		side = "left",
	},
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
})
