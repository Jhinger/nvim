return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	init = function()
		vim.api.nvim_create_user_command("LazyGit", function()
			Snacks.lazygit()
		end, {})
	end,
	opts = {
		dashboard = {
			enabled = true,
			preset = {
				header = [[
                                                       
   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
                                                       
]],
				keys = {
					{ icon = " ", key = "e", desc = "Toggle File Explorer", action = function() Snacks.explorer() end },
					{ icon = " ", key = "f", desc = "Find File", action = function() Snacks.picker.files() end },
					{ icon = " ", key = "w", desc = "Find Word", action = function() Snacks.picker.grep() end },
					{ icon = "󰦛 ", key = "s", desc = "Restore CWD Session", action = ":SessionRestore" },
					{ icon = " ", key = "q", desc = "Exit", action = ":qa" },
				},
			},
		},
		explorer = {
			enabled = true,
			replace_netrw = true,
			trash = true,
		},
		lazygit = {
			enabled = true,
			configure = true,
			theme = {
				activeBorderColor = { fg = "MatchParen", bold = true },
				inactiveBorderColor = { fg = "FloatBorder" },
				searchingActiveBorderColor = { fg = "DiagnosticWarn", bold = true },
				optionsTextColor = { fg = "Function" },
				selectedLineBgColor = { bg = "CursorLine" },
				selectedRangeBgColor = { bg = "CursorLine" },
				cherryPickedCommitBgColor = { bg = "Visual" },
				cherryPickedCommitFgColor = { fg = "Function" },
				markedBaseCommitBgColor = { bg = "Visual" },
				markedBaseCommitFgColor = { fg = "Function" },
				unstagedChangesColor = { fg = "DiagnosticError" },
				defaultFgColor = { fg = "Normal" },
			},
		},
		picker = {
			layout = { preset = "telescope" },
			sources = {
				explorer = {
					hidden = true,
					ignored = true,
					trash = true,
					exclude = { ".DS_Store", "node_modules" },
					win = {
						input = {},
						list = {
							keys = {
								["J"] = "explorer_down_fast",
								["K"] = "explorer_up_fast",
							},
						},
					},
				},
				files = {},
			},
			actions = {
				explorer_down_fast = function(picker)
					for _ = 1, 5 do
						Snacks.picker.actions.list_down(picker)
					end
				end,
				explorer_up_fast = function(picker)
					for _ = 1, 5 do
						Snacks.picker.actions.list_up(picker)
					end
				end,
			},
			win = {
				input = {
					keys = {
						["fc"] = { "cancel", mode = { "n" } },
					},
				},
				list = {
					keys = {
						["fc"] = "cancel",
					},
				},
			},
		},
		indent = {
			enabled = true,
			indent = {
				char = "┊",
			},
		},
		image = {
			enabled = true,
		},
	},
	keys = {
		{ "<leader>ef", function() Snacks.explorer() end, desc = "Open file explorer" },
		{ "<leader>ec", function()
			local explorer = Snacks.picker.get({ source = "explorer" })[1]
			if explorer and explorer.action then
				explorer:action("explorer_close_all")
			end
		end, desc = "Collapse file explorer" },
		{ "<leader>eh", function()
			local explorer = Snacks.explorer.reveal({ buf = 0 })
			if explorer and explorer.focus then
				explorer:focus("list", { show = true })
			end
		end, desc = "Focus explorer on current file" },
		{ "<leader>lg", function() Snacks.lazygit() end, desc = "Open lazygit" },
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
		{ "<leader>fs", function() Snacks.picker.recent({ filter = { cwd = true } }) end, desc = "Recent files" },
		{ "<leader>fw", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>ft", function() Snacks.picker.todo_comments() end, desc = "Find TODOs" },
	},
}
