return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		highlights = {
			-- Make the fill match the main background color
			fill = {
				fg = "#222436",
				bg = "#222436",
			},
			-- Make the buffer background match the main background color
			background = {
				fg = "#d9d9d9",
				bg = "#222436",
			},
			-- Configure inactive tabs
			tab = {
				fg = "#d9d9d9",
				bg = "#222436",
			},
			tab_selected = {
				fg = "#ffffff",
				bg = "#0d47a1", -- Blue color similar to lualine
			},
			tab_separator = {
				fg = "#222436",
				bg = "#222436",
			},
			tab_separator_selected = {
				fg = "#0d47a1",
				bg = "#0d47a1",
			},
			tab_close = {
				fg = "#d9d9d9",
				bg = "#222436",
			},
			close_button = {
				fg = "#d9d9d9",
				bg = "#222436",
			},
			close_button_visible = {
				fg = "#d9d9d9",
				bg = "#222436",
			},
			close_button_selected = {
				fg = "#ffffff",
				bg = "#0d47a1",
			},
			buffer_visible = {
				fg = "#d9d9d9",
				bg = "#222436",
			},
			-- Configure active buffer to be blue similar to lualine
			buffer_selected = {
				fg = "#ffffff",
				bg = "#0d47a1", -- Blue color similar to lualine
				bold = true,
				italic = false,
			},
			separator_selected = {
				fg = "#0d47a1",
				bg = "#0d47a1",
			},
			separator_visible = {
				fg = "#222436",
				bg = "#222436",
			},
			separator = {
				fg = "#222436",
				bg = "#222436",
			},
			indicator_visible = {
				fg = "#222436",
				bg = "#222436",
			},
			indicator_selected = {
				fg = "#0d47a1",
				bg = "#0d47a1",
			},
			modified = {
				fg = "#ffb86c",
				bg = "#222436",
			},
			modified_visible = {
				fg = "#ffb86c",
				bg = "#222436",
			},
			modified_selected = {
				fg = "#ffb86c",
				bg = "#0d47a1",
			},
			diagnostic_selected = {
				fg = "#ffffff",
				bg = "#0d47a1",
				bold = true,
			},
			info_selected = {
				fg = "#ffffff",
				bg = "#0d47a1",
				bold = true,
			},
			info_diagnostic_selected = {
				fg = "#ffffff",
				bg = "#0d47a1",
				bold = true,
			},
			warning_selected = {
				fg = "#ffffff",
				bg = "#0d47a1",
				bold = true,
			},
			warning_diagnostic_selected = {
				fg = "#ffffff",
				bg = "#0d47a1",
				bold = true,
			},
			error_selected = {
				fg = "#ffffff",
				bg = "#0d47a1",
				bold = true,
			},
			error_diagnostic_selected = {
				fg = "#ffffff",
				bg = "#0d47a1",
				bold = true,
			},
		},
		options = {
			diagnostics = "nvim_lsp",
			mode = "buffers",
			separator_style = "thin",
			themeable = true,
			show_buffer_icons = true,
			show_close_icon = false,
			offsets = {
				{
					filetype = "NvimTree",
					text_align = "center",
					highlight = "Directory",
					separator = true,
				},
			},
		},
	},
}
