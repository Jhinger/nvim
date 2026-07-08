vim.api.nvim_create_autocmd("FileType", {
	pattern = { "svelte", "vue" },
	callback = function(event)
		pcall(vim.treesitter.start, event.buf)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
		"typescript",
		"typescriptreact",
		"javascript",
		"javascriptreact",
		"python",
		"ruby",
		"html",
		"css",
		"yaml",
		"yaml.helm-values",
		"json",
		"markdown",
		"go",
		"terraform",
		"helm",
	},
	callback = function()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

vim.treesitter.language.register("yaml", "yaml.helm-values")

vim.api.nvim_create_autocmd("User", {
	pattern = "SessionSavePost",
	callback = function()
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= "" then
				pcall(vim.treesitter.start, buf)
			end
		end
	end,
})

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			ensure_installed = {
				"javascript",
				"typescript",
				"lua",
				"ruby",
				"svelte",
				"vue",
				"json",
				"sql",
				"tsx",
				"html",
				"css",
				"vim",
				"dockerfile",
				"gitignore",
				"yaml",
				"prisma",
				"jsdoc",
				"regex",
				"scss",
				"markdown",
				"markdown_inline",
				"bash",
				"helm",
				"go",
				"gomod",
				"gowork",
				"gotmpl",
				"terraform",
				"hcl",
			},
		})
	end,
}
