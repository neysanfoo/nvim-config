if vim.g.vscode then
	-- require("neysan.keymaps")
	-- require("neysan.options")
else
	require("neysan.keymaps")
	require("neysan.options")
	-- require("neysan.packer")
	require("neysan.lazy")
	require("neysan.plugin_config")
	require("neysan.coderunner")
end
