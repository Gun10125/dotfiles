-- Bootstrap lazy.nvim (plugin manager) — clones itself on first run
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" },
}, {
  -- Prevent lazy.nvim from resetting runtimepath — required so that
  -- our custom "~/Documents/dotfiles/nvim" path (prepended in init.lua)
  -- stays available for require("config.*") calls after this point.
  performance = {
    rtp = {
      reset = false,
    },
  },
})
