-- Popup showing available keybindings when leader key is pressed
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({})
  end,
}
