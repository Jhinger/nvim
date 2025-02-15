return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		highlights = {
			buffer_selected = { bold = true },
			diagnostic_selected = { bold = true },
			info_selected = { bold = true },
			info_diagnostic_selected = { bold = true },
			warning_selected = { bold = true },
			warning_diagnostic_selected = { bold = true },
			error_selected = { bold = true },
			error_diagnostic_selected = { bold = true },
		},
		options = {
			diagnostics = "nvim_lsp",
			mode = "buffers",
			seperator_style = "slant",
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
