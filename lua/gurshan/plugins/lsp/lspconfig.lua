return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
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
		local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/bin/")
		vim.env.PATH = mason_path .. ":" .. vim.env.PATH

		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config("ts_ls", {
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

		vim.lsp.config("vtsls", {
			filetypes = { "vue" },
			settings = {
				vtsls = {
					tsserver = {
						globalPlugins = {
							{
								name = "@vue/typescript-plugin",
								location = vim.fn.stdpath("data")
									.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
								languages = { "vue" },
								configNamespace = "typescript",
							},
						},
					},
				},
			},
		})

		vim.lsp.config("svelte", {
			settings = {
				svelte = {
					plugin = {
						typescript = { enable = true },
						css = { enable = true },
					},
				},
			},
		})

		vim.lsp.config("ruby_lsp", {
			cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
			init_options = {
				formatter = "auto",
				featuresConfiguration = {
					inlayHint = {
						implicitHashValue = true,
						implicitRescue = true,
					},
				},
			},
		})

		vim.lsp.config("gopls", {
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

		vim.lsp.config("terraformls", {
			filetypes = { "terraform", "terraform-vars", "hcl" },
		})

		vim.lsp.config("vue_ls", {
			filetypes = { "vue" },
		})

		vim.lsp.config("lua_ls", {
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

		vim.lsp.config("helm_ls", {
			settings = {
				["helm-ls"] = {
					yamlls = {
						path = "yaml-language-server",
					},
				},
			},
		})

		vim.lsp.enable({
			"ts_ls",
			"vtsls",
			"svelte",
			"ruby_lsp",
			"gopls",
			"terraformls",
			"vue_ls",
			"lua_ls",
			"helm_ls",
			"docker_compose_language_service",
			"html",
			"cssls",
			"tailwindcss",
			"marksman",
		})

		vim.keymap.set("n", "<leader>gr", function()
			Snacks.picker.lsp_references()
		end, { desc = "References" })

		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, { desc = "Go to declaration" })

		vim.keymap.set("n", "<leader>gld", function()
			Snacks.picker.lsp_definitions()
		end, { desc = "Definitions" })

		vim.keymap.set("n", "<leader>gi", function()
			Snacks.picker.lsp_implementations()
		end, { desc = "Implementations" })

		vim.keymap.set("n", "<leader>gt", function()
			Snacks.picker.lsp_type_definitions()
		end, { desc = "Type definitions" })

		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })

		vim.keymap.set("n", "<leader>d", function()
			vim.diagnostic.open_float(nil, { border = "single", source = "always" })
		end, { desc = "Line diagnostics" })

		vim.keymap.set("n", "<leader>D", function()
			vim.lsp.buf.hover({ border = "single" })
		end, { desc = "Hover documentation" })

		vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })

		vim.keymap.set("n", "<leader>uh", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, { desc = "Toggle inlay hints" })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				if not client then
					return
				end

				if client.name == "ruby_lsp" then
					vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
				end

				if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local bufnr = ev.buf
					local highlight_augroup = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
					vim.api.nvim_clear_autocmds({ buffer = bufnr, group = highlight_augroup })
					vim.api.nvim_create_autocmd("CursorHold", {
						buffer = bufnr,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd("CursorMoved", {
						buffer = bufnr,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			virtual_text = {
				source = "if_many",
				spacing = 2,
			},
			severity_sort = true,
			float = {
				border = "single",
				source = "always",
			},
		})
	end,
}
