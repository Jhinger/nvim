require("gurshan.core.options")
require("gurshan.core.keymaps")

-- Open Snacks explorer on startup, focused on the tree
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if not _G.Snacks or not Snacks.explorer then
			return
		end
		local explorer = nil
		if Snacks.picker and Snacks.picker.get then
			explorer = Snacks.picker.get({ source = "explorer" })[1]
		end
		if explorer then
			return
		end
		explorer = Snacks.explorer.reveal({ buf = 0 })
		if explorer and explorer.focus then
			explorer:focus("list", { show = true })
		end
	end,
})
