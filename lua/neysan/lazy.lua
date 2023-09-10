local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Which Key
	{ "folke/which-key.nvim" },

	-- Colorschemes
	{ "ellisonleao/gruvbox.nvim" },
	{ "neanias/everforest-nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "ful1e5/onedark.nvim" },

	-- Completion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },

	-- Snippets
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets" },

	-- LSP
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "RRethy/vim-illuminate" },

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter" },

	-- Other
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{ "windwp/nvim-ts-autotag" },
	{ "windwp/nvim-autopairs" },
	{ "github/copilot.vim" },
	{ "nvim-tree/nvim-tree.lua" },
	{ "ahmedkhalf/project.nvim" },
	{ "numtostr/Comment.nvim" },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "christianchiarulli/lualine.nvim" },
	{ "lewis6991/gitsigns.nvim" },
  {'akinsho/toggleterm.nvim', version = "*", config = true},
	-- Code Runner
	{ "neysanfoo/coderunner.nvim" },
	{ "CRAG666/code_runner.nvim" },

	-- UI
	{ "MunifTanjim/nui.nvim" },
	{ -- This plugin
		"neysanfoo/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults" },
		dependencies = { "stevearc/overseer.nvim" },
		config = function(_, opts)
			require("compiler").setup(opts)
		end,
	},
	{ -- The framework we use to run tasks
		"stevearc/overseer.nvim",
		commit = "3047ede61cc1308069ad1184c0d447ebee92d749", -- Recommended to to avoid breaking changes
		cmd = { "CompilerOpen", "CompilerToggleResults" },
		opts = {
			-- Tasks are disposed 5 minutes after running to free resources.
			-- If you need to close a task inmediatelly:
			-- press ENTER in the menu you see after compiling on the task you want to close.
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1,
				bindings = {
					["q"] = function()
						vim.cmd("OverseerClose")
					end,
				},
			},
		},
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
