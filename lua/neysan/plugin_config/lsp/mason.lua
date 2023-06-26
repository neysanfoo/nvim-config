local servers = {
	"lua_ls",
	-- "cssls",
	"html",
	"tsserver",
	"pyright",
	-- "bashls",
	"jsonls",
	-- "yamlls",
	-- "clangd",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("neysan.plugin_config.lsp.handlers").on_attach,
		capabilities = require("neysan.plugin_config.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "neysan.plugin_config.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end

lspconfig.clangd.setup{
  cmd = {"clangd", "--background-index", "--suggest-missing-includes", "--cross-file-rename", "--header-insertion=iwyu", "--clang-tidy", "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,bugprone-*,google-*,cppcoreguidelines-*", "--offset-encoding=utf-16"},
  on_attach = require("neysan.plugin_config.lsp.handlers").on_attach,
  capabilities = require("neysan.plugin_config.lsp.handlers").capabilities,
}
