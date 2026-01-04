return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		{
			"hrsh7th/nvim-cmp",
			opts = function(_, opts)
				opts.sources = opts.sources or {}
				table.insert(opts.sources, {
					name = "lazydev",
					group_index = 0,
				})
			end,
		},
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP references"
				keymap.set("n", "<leader>gr", function()
					Snacks.picker.lsp_references()
				end, opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "<leader>gld", function()
					Snacks.picker.lsp_definitions()
				end, opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "<leader>gi", function()
					Snacks.picker.lsp_implementations()
				end, opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "<leader>gt", function()
					Snacks.picker.lsp_type_definitions()
				end, opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "<leader>D", function()
					vim.lsp.buf.hover({ border = "single", anchor_bias = "below" })
				end, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- TypeScript / JavaScript (tsserver via ts_ls)
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			single_file_support = true,
			init_options = {
				hostInfo = "neovim",
				maxTsServerMemory = 4096,
				tsserver = {
					useSyntaxServer = "auto",
				},
			},
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
		})

		-- Svelte
		vim.lsp.config("svelte", {
			capabilities = capabilities,
			settings = {
				svelte = {
					plugin = {
						typescript = {
							enable = true,
						},
						css = {
							enable = true,
						},
					},
				},
			},
		})

		-- Ruby (solargraph)
		vim.lsp.config("solargraph", {
			capabilities = capabilities,
			cmd = { "bundle", "exec", "solargraph", "stdio" },
			settings = {
				solargraph = {
					autoformat = true,
					completion = true,
					diagnostics = true,
					folding = true,
					references = true,
					rename = true,
					symbols = true,
				},
			},
		})

		-- Go (gopls)
		vim.lsp.config("gopls", {
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					gofumpt = true,
				},
			},
		})

		-- Ruby (rubocop LSP)
		vim.lsp.config("rubocop", {
			capabilities = capabilities,
			cmd = { "bundle", "exec", "rubocop" },
		})
		vim.lsp.enable("rubocop")

		-- Vue (vue_ls / Volar)
		vim.lsp.config("vue_ls", {
			capabilities = capabilities,
			filetypes = { "vue" },
			init_options = {
				vue = {
					hybridMode = false,
				},
				typescript = {
					tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
				},
			},
		})

		-- Lua (lua_ls)
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
	end,
}
