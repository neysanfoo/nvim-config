local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "neysan.plugin_config.lsp.mason"
require("neysan.plugin_config.lsp.handlers").setup()
require "neysan.plugin_config.lsp.null-ls"
