vim.opt.rtp:prepend(vim.fn.expand("~/Documents/dotfiles/nvim"))

require("config.options")
require("config.plugins")
require("config.keymaps")
require("config.colors")