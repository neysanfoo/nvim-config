-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"folke/which-key.nvim",
	})

	-- Colorschemes
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "neanias/everforest-nvim" })
	use({ "EdenEast/nightfox.nvim" })
	use({ "ful1e5/onedark.nvim" })

	-- Cmp
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/mason.nvim" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" })

	-- Other
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
	use({ "windwp/nvim-ts-autotag" }) -- integrates with treesitter
	use({ "windwp/nvim-autopairs" }) -- autopairs, integrates with both cmp and treesitter
	use({ "github/copilot.vim" })
	use({ "nvim-tree/nvim-tree.lua" })
	use({ "ahmedkhalf/project.nvim" })
	use({ "numtostr/Comment.nvim" })
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
	use({ "christianchiarulli/lualine.nvim" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "akinsho/toggleterm.nvim" })

	use({ "neysanfoo/coderunner.nvim" })

	use({ "CRAG666/code_runner.nvim" })
end)
