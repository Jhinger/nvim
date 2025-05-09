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
		-- { "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP references"
				keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "<leader>gld", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "<leader>hd", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "<leader>ld", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "<leader>D", function()
					vim.lsp.buf.hover({ border = "single", anchor_bias = "below" })
				end, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["ts_ls"] = function()
				lspconfig.ts_ls.setup({
					capabilities = capabilities,
					root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
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
			end,
			["solargraph"] = function()
				lspconfig.solargraph.setup({
					capabilities = capabilities,
					root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
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
			end,
			["gopls"] = function()
				lspconfig.gopls.setup({
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
			end,
			["rubocop"] = function()
				lspconfig.rubocop.setup({
					capabilities = capabilities,
					cmd = { "bundle", "exec", "rubocop" },
					root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
				})
			end,
			["volar"] = function()
				lspconfig.volar.setup({
					capabilities = capabilities,
					filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
					init_options = {
						vue = {
							hybridMode = false,
						},
						typescript = {
							tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
						},
					},
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
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
		})
	end,
}
