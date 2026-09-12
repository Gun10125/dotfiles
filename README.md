# Dotfiles

Personal Windows dotfiles for **Neovim** and **PowerShell**.

## Contents

- [Neovim](#neovim)
- [PowerShell](#powershell)
- [Setup](#setup)

## Neovim

- Modular Lua configuration managed by [lazy.nvim](https://github.com/folke/lazy.nvim)
- Dashboard, NERDTree file explorer, bufferline and lualine
- Git signs with [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- Syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Custom transparent colorscheme and useful keymaps

## PowerShell

- Git aliases and helper functions
- [Oh My Posh](https://ohmyposh.dev/) prompt with a custom theme
- Terminal icons, directory jumping and PSReadLine autocomplete
- Fuzzy file and history search with [fzf](https://github.com/junegunn/fzf) and [PSFzf](https://github.com/kelleyma49/PSFzf)

## Setup

- [PowerShell setup](setup/setup_pwsh.md)
- [Neovim setup](setup/setup_nvim.md)

The setup guides configure the system entry points to load the files in this repository:

- Neovim: `$env:LOCALAPPDATA\nvim\init.lua`
- PowerShell: `$PROFILE`

