# Dotfiles

Personal Windows dotfiles for **Neovim** and **PowerShell**.

## Contents

- [Neovim setup](#neovim-setup)
- [PowerShell setup](#powershell-setup)
- [Repository layout](#repository-layout)
- [Installation guides](#installation-guides)

## Neovim setup

This configuration is written in modular Lua and bootstraps [lazy.nvim](https://github.com/folke/lazy.nvim) automatically.

### Included

- Dashboard powered by [snacks.nvim](https://github.com/folke/snacks.nvim)
- File explorer with [NERDTree](https://github.com/preservim/nerdtree)
- Bufferline and statusline with [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) and [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- Git signs with [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- Syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Custom transparent colorscheme and keymaps

### Requirements

- [Neovim](https://neovim.io/) and Git
- A C compiler for Treesitter parsers
- [fd](https://github.com/sharkdp/fd) for file searching
- A [Nerd Font](https://www.nerdfonts.com/) for icons (optional)
- A terminal with true-color and transparency support

## PowerShell setup

PowerShell configuration for Windows with a themed prompt and practical command-line helpers.

### Included

- Git aliases and helper functions
- [Oh My Posh](https://ohmyposh.dev/) prompt with a custom theme
- [Terminal-Icons](https://github.com/devblackops/Terminal-Icons) for file and folder icons
- [z](https://www.powershellgallery.com/packages/z) for directory jumping
- PSReadLine history prediction and menu completion
- Fuzzy file and history search with [fzf](https://github.com/junegunn/fzf) and [PSFzf](https://github.com/kelleyma49/PSFzf)

## Installation guides

- [PowerShell setup](setup/setup_pwsh.md)
- [Neovim setup](setup/setup_nvim.md)

The setup guides connect the system entry points to the files in this repository:

- Neovim: `$env:LOCALAPPDATA\nvim\init.lua`
- PowerShell: `$PROFILE`
