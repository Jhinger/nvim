return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = function()
		local bg = "#222436"
		local blue = "#0d47a1"
		local fg = "#d9d9d9"
		local fg_selected = "#ffffff"
		local orange = "#ffb86c"
		local yellow = "#ffca28"

		return {
			options = {
				diagnostics = "nvim_lsp",
				mode = "buffers",
				separator_style = "thin",
				show_buffer_icons = true,
				show_close_icon = false,
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				diagnostics_indicator = function(_, _, diag)
					local icons = {
						Error = " ",
						Warn = " ",
						Hint = " ",
						Info = " ",
					}
					local ret = ""
					for k, v in pairs(diag) do
						ret = ret .. ((icons[k] or "") .. " " .. v .. " ")
					end
					return ret
				end,
			},
			highlights = {
				fill = { fg = bg, bg = bg },
				background = { fg = fg, bg = bg },
				tab = { fg = fg, bg = bg },
				tab_selected = { fg = fg_selected, bg = blue },
				tab_separator = { fg = bg, bg = bg },
				tab_separator_selected = { fg = blue, bg = blue },
				tab_close = { fg = fg, bg = bg },
				close_button = { fg = fg, bg = bg },
				close_button_visible = { fg = fg, bg = bg },
				close_button_selected = { fg = fg_selected, bg = blue },
				buffer_visible = { fg = fg, bg = bg },
				buffer_selected = { fg = fg_selected, bg = blue, bold = true, italic = false },
				separator_selected = { fg = blue, bg = blue },
				separator_visible = { fg = bg, bg = bg },
				separator = { fg = bg, bg = bg },
				indicator_visible = { fg = bg, bg = bg },
				indicator_selected = { fg = blue, bg = blue },
				modified = { fg = orange, bg = bg },
				modified_visible = { fg = orange, bg = bg },
				modified_selected = { fg = orange, bg = blue },
				diagnostic_selected = { fg = fg_selected, bg = blue, bold = true },
				warning = { fg = yellow, bg = bg },
				warning_visible = { fg = yellow, bg = bg },
				info = { fg = "#82aaff", bg = blue },
				info_visible = { fg = "#82aaff", bg = blue },
				info_selected = { fg = fg_selected, bg = blue, bold = true },
				info_diagnostic_selected = { fg = fg_selected, bg = blue, bold = true },
				warning_selected = { fg = fg_selected, bg = blue, bold = true },
				warning_diagnostic_selected = { fg = fg_selected, bg = blue, bold = true },
				error_selected = { fg = fg_selected, bg = blue, bold = true },
				error_diagnostic_selected = { fg = fg_selected, bg = blue, bold = true },
				duplicate_selected = { fg = fg_selected, bg = blue, italic = true },
				duplicate_visible = { fg = fg, bg = bg, italic = true },
				duplicate = { fg = fg, bg = bg, italic = true },
			},
		}
	end,
}
