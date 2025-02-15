return {
  "navarasu/onedark.nvim",
  config = function()
    require("onedark").setup({
      style = "darker",
      transparent = true,
      code_style = {
        comments = "italic"
      },
      lualine = {
        transparent = false
      }
    })

    vim.cmd("colorscheme onedark")
  end
}
