return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<leader>ef",
			function()
				Snacks.explorer()
			end,
			desc = "Open file explorer",
		},
		{
			"<leader>ec",
			function()
				local explorer = nil
				if Snacks.picker and Snacks.picker.get then
					explorer = Snacks.picker.get({ source = "explorer" })[1]
				end
				if not explorer then
					explorer = Snacks.explorer()
				end
				if explorer and explorer.action then
					explorer:action("explorer_close_all")
				end
			end,
			desc = "Collapse file explorer",
		},
		{
			"<leader>eh",
			function()
				local explorer = Snacks.explorer.reveal({ buf = 0 })
				if explorer and explorer.focus then
					explorer:focus("list", { show = true })
				end
			end,
			desc = "Focus file explorer on current file",
		},
		{
			"<leader>lg",
			function()
				if Snacks and Snacks.lazygit then
					Snacks.lazygit()
				else
					vim.cmd("LazyGit")
				end
			end,
			desc = "Open lazy git",
		},
		-- Snacks picker (replaces Telescope)
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Fuzzy find files in cwd",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.recent({ filter = { cwd = true } })
			end,
			desc = "Fuzzy find recent files",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep()
			end,
			desc = "Find string in cwd",
		},
		{
			"<leader>ft",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Find Todos",
		},
		-- Additional Snacks picker keymaps (uncomment any you like)
		-- { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		-- { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Git files" },
		-- { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
		-- { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files (all)" },
	},
	---@type snacks.Config
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
					{
						icon = " ",
						key = "e",
						desc = "Toggle File Explorer",
						action = function()
							Snacks.explorer.reveal()
						end,
					},
					{
						icon = " ",
						key = "f",
						desc = "Find File",
						action = function()
							Snacks.picker.files()
						end,
					},
					{
						icon = " ",
						key = "w",
						desc = "Find Word",
						action = function()
							Snacks.picker.grep()
						end,
					},
					{
						icon = "󰦛 ",
						key = "s",
						desc = "Restore CWD Session",
						action = ":SessionRestore",
					},
					{
						icon = " ",
						key = "q",
						desc = "Exit",
						action = ":qa",
					},
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
		},

		picker = {
			layout = { preset = "telescope" },
			sources = {
				explorer = {
					exclude = { ".DS_Store", "node_modules" },
					win = {
						input = {},
						list = {
							keys = {
								["f"] = "focus_input",
							},
						},
					},
				},
				files = {
					hidden = true,
				},
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
	},
}
