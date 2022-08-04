local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[ ________   _______       ___    ___ ________  ________  ________      ]],
	[[|\   ___  \|\  ___ \     |\  \  /  /|\   ____\|\   __  \|\   ___  \    ]],
	[[\ \  \\ \  \ \   __/|    \ \  \/  / | \  \___|\ \  \|\  \ \  \\ \  \   ]],
	[[ \ \  \\ \  \ \  \_|/__   \ \    / / \ \_____  \ \   __  \ \  \\ \  \  ]],
	[[  \ \  \\ \  \ \  \_|\ \   \/  /  /   \|____|\  \ \  \ \  \ \  \\ \  \ ]],
	[[   \ \__\\ \__\ \_______\__/  / /       ____\_\  \ \__\ \__\ \__\\ \__\]],
	[[    \|__| \|__|\|_______|\___/ /       |\_________\|__|\|__|\|__| \|__|]],
	[[                        \|___|/        \|_________|                    ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                 ___      ___ ___  _____ ______                        ]],
	[[                |\  \    /  /|\  \|\   _ \  _   \                      ]],
	[[                \ \  \  /  / | \  \ \  \\\__\ \  \                     ]],
	[[                 \ \  \/  / / \ \  \ \  \\|__| \  \                    ]],
	[[                  \ \    / /   \ \  \ \  \    \ \  \                   ]],
	[[                   \ \__/ /     \ \__\ \__\    \ \__\                  ]],
	[[                    \|__|/       \|__|\|__|     \|__|                  ]],
	[[                                                                       ]],
	[[                                                                       ]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
	dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
