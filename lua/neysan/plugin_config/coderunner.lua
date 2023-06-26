	require("coderunner").setup({
		filetype_commands = {
			python = "python3 -u $fullFilePath",
			c = { "gcc $fullFilePath -o $dir/out", "$dir/./out" },
			cpp = { "g++ $fullFilePath -o $dir/out", "$dir/./out" },
			java = { "javac $fullFilePath", "java -cp .:$dir $fileNameWithoutExt" },
			javascript = "node $fullFilePath",
		},
		buffer_height = 10,
		focus_back = true,
	})

