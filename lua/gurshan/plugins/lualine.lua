return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "#112638",
			inactive_bg = "#2c3043",
		}

		return {
			options = {
				theme = {
					normal = {
						a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
						b = { bg = colors.bg, fg = colors.fg },
						c = { bg = colors.bg, fg = colors.fg },
					},
					insert = {
						a = { bg = colors.green, fg = colors.bg, gui = "bold" },
						b = { bg = colors.bg, fg = colors.fg },
						c = { bg = colors.bg, fg = colors.fg },
					},
					visual = {
						a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
						b = { bg = colors.bg, fg = colors.fg },
						c = { bg = colors.bg, fg = colors.fg },
					},
					command = {
						a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
						b = { bg = colors.bg, fg = colors.fg },
						c = { bg = colors.bg, fg = colors.fg },
					},
					replace = {
						a = { bg = colors.red, fg = colors.bg, gui = "bold" },
						b = { bg = colors.bg, fg = colors.fg },
						c = { bg = colors.bg, fg = colors.fg },
					},
					inactive = {
						a = { bg = colors.inactive_bg, fg = colors.fg, gui = "bold" },
						b = { bg = colors.inactive_bg, fg = colors.fg },
						c = { bg = colors.inactive_bg, fg = colors.fg },
					},
				},
				disabled_filetypes = { "snacks_dashboard" },
			},
			sections = {
				lualine_x = {
					{
						function()
							local lazy_status = require("lazy.status")
							return lazy_status.updates
						end,
						cond = function()
							local lazy_status = require("lazy.status")
							return lazy_status.has_updates
						end,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						shorting_target = 40,
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
						},
					},
				},
			},
		}
	end,
}
