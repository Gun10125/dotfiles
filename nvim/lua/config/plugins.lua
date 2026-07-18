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

  -- Dashboard: startup screen with custom OMEGA ASCII header
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = [[
 ██████╗ ███╗   ███╗███████╗ ██████╗  █████╗
██╔═══██╗████╗ ████║██╔════╝██╔════╝ ██╔══██╗
██║   ██║██╔████╔██║█████╗  ██║  ███╗███████║
██║   ██║██║╚██╔╝██║██╔══╝  ██║   ██║██╔══██║
╚██████╔╝██║ ╚═╝ ██║███████╗╚██████╔╝██║  ██║
 ╚═════╝ ╚═╝     ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
          ]],
        },
      },
    },
  },

  -- File explorer sidebar (toggle with Ctrl+T, keymaps in keymaps.lua)
  { "preservim/nerdtree" },

  -- Statusline (bottom bar): mode, git branch, filename, cursor position
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "auto" }, -- reads colors from the active colorscheme (colors.lua)
      })
    end,
  },

  -- Buffer/tab line (top bar): shows currently open files as tabs
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          show_buffer_close_icons = true,
          show_close_icon = false,
        },
      })
    end,
  },

  -- Popup showing available keybindings when leader key is pressed
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({})
    end,
  },

  -- Treesitter: advanced syntax highlighting that understands code structure
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({ "lua", "vim", "vimdoc", "markdown", "json", "bash" })
    end,
  },

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
