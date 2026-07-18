-- Treesitter: advanced syntax highlighting that understands code structure
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({ "lua", "vim", "vimdoc", "markdown", "json", "bash" })
  end,
}
