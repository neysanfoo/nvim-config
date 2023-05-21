## Neovim Configuration

This is a repository for my personal Neovim configuration.

### Configuration Files

Here is a brief summary of what each file does:

- `init.lua`: This file is the starting point for the configuration. It requires several other files, which in turn set up various aspects of Neovim.
- `packer.lua`: This file manages the plugins that the configuration uses.
- `options.lua`: This file sets up the various options for Neovim.
- `keymaps.lua`: This file sets up key mappings to make Neovim easier to use.

## Plugins Used

- [Packer](https://github.com/wbthomason/packer.nvim): A package manager for Neovim.
- [Telescope](https://github.com/nvim-telescope/telescope.nvim): A fuzzy finder and sorter.
- [Which Key](https://github.com/folke/which-key.nvim): A plugin that shows you the available keybindings.
- Color Schemes: [Gruvbox](https://github.com/ellisonleao/gruvbox.nvim), [Everforest](https://github.com/neanias/everforest-nvim), [Nightfox](https://github.com/EdenEast/nightfox.nvim), [Onedark](https://github.com/ful1e5/onedark.nvim), [Catppuccin](https://github.com/catppuccin/nvim)
- [Cmp](https://github.com/hrsh7th/nvim-cmp) and its various plugins: Autocompletion plugins.
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) and [Friendly Snippets](https://github.com/rafamadriz/friendly-snippets): Snippet engines.
- [LSP](https://github.com/neovim/nvim-lspconfig) and [Mason](https://github.com/iamcco/mason.nvim): Language Server Protocols and their installer.
- [Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim): A plugin for formatters and linters.
- [Illuminate](https://github.com/RRethy/vim-illuminate): Helps with highlighting references in the code.
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Syntax highlighting and code understanding.
- [Surround](https://github.com/kylechui/nvim-surround): Allows easy manipulation of "surroundings" in the code.
- [TS AutoTag](https://github.com/windwp/nvim-ts-autotag) and [Autopairs](https://github.com/windwp/nvim-autopairs): Automatically closes XML/HTML tags and pairs of brackets/quotes.
- [Copilot](https://github.com/github/copilot.vim): A code suggestion engine by GitHub.
- [Nvim-Tree](https://github.com/nvim-tree/nvim-tree.lua): A file explorer.
- [Project](https://github.com/ahmedkhalf/project.nvim): Project navigation.
- [Comment](https://github.com/numtostr/Comment.nvim): Easy code commenting.
- [Bufferline](https://github.com/akinsho/nvim-bufferline.lua): A better bufferline for Neovim.
- [Lualine](https://github.com/christianchiarulli/lualine.nvim): A light and configurable statusline/tabline for Neovim.
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim): Shows git signs in the code.
- [ToggleTerm](https://github.com/akinsho/nvim-toggleterm.lua): Terminal integration.

Please note that this README reflects the configuration state as of May 2023. For updates or changes to the plugins after this date, please refer to the respective plugin's documentation.
### Installation

To install this configuration, follow these steps:

1. Install Neovim.
2. Clone this repository to your Neovim configuration directory. For Unix-based systems, this is typically `~/.config/nvim`.
3. Open Neovim and run `:PackerInstall`. This will install all the plugins specified in `packer.lua`.

### Setup

No additional setup should be necessary beyond the installation instructions above. The configuration files have been set up to automatically configure Neovim when it starts.

### Dependencies

This configuration requires the Neovim text editor, version 0.5 or higher. All other dependencies (i.e., plugins) are managed by the configuration itself.

### Shortcuts

Here are some notable shortcuts defined in the configuration:

- Window navigation: `<C-h/j/k/l>` (navigate left/down/up/right between windows)
- Resize windows: `<C-Up/Down/Left/Right>` (resize current window)
- Navigate buffers: `<S-l/h>` (move to next/previous buffer)
- Clear search highlight: `<Leader>h`
- Close buffer: `<S-q>`
- Better paste in visual mode: `p`
- Save file: `<Leader>w`
- Stay in indent mode in visual mode: `<, >`
- Move text up and down in visual block mode: `J, K`
- Comment code: `<Leader>/`

The `<Leader>` key is defined as the space key (` `).

Please see `keymaps.lua` for the complete list of key mappings.
