-- Statusline (bottom bar): mode, git branch, filename, cursor position
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = { theme = "auto" }, -- reads colors from the active colorscheme (colors.lua)
    })
  end,
}
