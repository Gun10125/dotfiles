vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "my_custom"

local hl = vim.api.nvim_set_hl

-- Background / Basic font
hl(0, "Normal", { bg = "NONE", fg = "#c9d1d9" }) -- bg = NONE is transparent.
hl(0, "NormalFloat", { bg = "NONE" })
hl(0, "SignColumn", { bg = "NONE" })
hl(0, "LineNr", { fg = "#484f58" })
hl(0, "CursorLineNr", { fg = "#e6edf3", bold = true })
hl(0, "CursorLine", { bg = "#161b22" })

-- Syntax
hl(0, "Comment", { fg = "#8b949e", italic = true })
hl(0, "Keyword", { fg = "#ff7b72", bold = true })
hl(0, "String", { fg = "#a5d6ff" })
hl(0, "Function", { fg = "#d2a8ff" })
hl(0, "Identifier", { fg = "#79c0ff" })
hl(0, "Type", { fg = "#ffa657" })
hl(0, "Constant", { fg = "#79c0ff" })
hl(0, "Number", { fg = "#79c0ff" })

-- UI other
hl(0, "Pmenu", { bg = "#161b22", fg = "#c9d1d9" })
hl(0, "PmenuSel", { bg = "#30363d", fg = "#ffffff" })
hl(0, "StatusLine", { bg = "#161b22", fg = "#c9d1d9" })
