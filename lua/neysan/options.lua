local options = {
	clipboard = "unnamedplus",            -- allows neovim to access the system clipboard
	cmdheight = 1,                        -- more space in the neovim command line for displaying messages
	completeopt = { 'menuone', 'noselect' }, -- set completeopt to have a better completion experience
	conceallevel = 0,                     -- so that `` is visible in markdown files
	fileencoding = "utf-8",               -- the encoding written to a file
	hlsearch = true,                      -- highlight all matches on previous search pattern
	ignorecase = true,                    -- ignore case in search patterns
	mouse = "a",                          -- allow the mouse to be used in neovim
	pumheight = 10,                       -- pop up menu height
	shiftwidth = 2,                       -- the number of spaces inserted for each indentation
	smartcase = true,                     -- smart case
	smartindent = true,                   -- make indenting smarter again
	splitbelow = true,                    -- force all horizontal splits to go below current window
	splitright = true,                    -- force all vertical splits to go to the right of current window
	tabstop = 2,                          -- insert 2 spaces for a tab
	number = true,                        -- set numbered lines
	relativenumber = true,                -- set relative numbered lines
	wrap = false,                         -- display lines as one long line
	scrolloff = 8,                        -- is one of my fav
	sidescrolloff = 8,                    -- is one of my fav
	autoindent = true,                    -- copy indent from current line when starting a new line
	cursorline = true,                    -- highlight the current line
	showmatch = true,                     -- show matching brackets when text indicator is over them
	updatetime = 300,                     -- faster completion
}


for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.cmd [[set iskeyword+=-]] -- Treats hello-world as a one word

-- vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.opt.fillchars = vim.opt.fillchars + 'eob: '
-- vim.opt.shortmess:append "c"
