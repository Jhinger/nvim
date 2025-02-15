return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-f>"] = cmp.mapping.abort(), -- close completion window
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp", max_item_count = 25, group_index = 1 },
				{ name = "buffer", max_item_count = 5, group_index = 2 },
				{ name = "luasnip" }, -- snippets
				{ name = "path" }, -- file system paths
			}),

			performance = {
				debounce = 0,
				throttle = 0,
			},

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				expandable_indicator = false,
				format = lspkind.cmp_format({
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
