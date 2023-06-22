local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear search highlight
keymap("n", "<Leader>h", ":nohlsearch<CR>", opts)

-- Close buffer
keymap("n", "<S-q>", ":bd<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Save file
keymap("n", "<Leader>w", ":w<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Comments --
keymap("n", "<Leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<Leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)

-- Coderunner --
vim.api.nvim_set_keymap('n', '<C-i>', ':Run<CR>', { noremap = true, silent = true })

