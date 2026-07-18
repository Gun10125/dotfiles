-- Git diff indicators in the sign column (added/changed/removed lines)
return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
  end,
}
