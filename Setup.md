# Windows Dev Environment Setup Guide

Setup guide for a new machine (install steps only — config content lives in
`dotfiles\powershell\profile.ps1` and `dotfiles\nvim\init.vim` already, no need to repeat it here)

## Step 1: PowerShell Core 7

Install via Microsoft Store (search "PowerShell") or:

```powershell
winget install --id Microsoft.PowerShell -e
```

## Step 2: Execution Policy

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Step 3: Scoop

```powershell
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

## Step 4: Git (install first — scoop needs git to add buckets)

```powershell
scoop install git
```

## Step 5: Nerd Font

```powershell
scoop bucket add nerd-fonts
scoop install Hack-NF
```

Set Windows Terminal / VS Code terminal font to: `Hack Nerd Font Mono`

## Step 6: Neovim + Vim

```powershell
scoop install neovim
scoop install vim
```

## Step 7: NodeJS

```powershell
scoop install nodejs-lts
```

## Step 8: Yarn (required by coc.nvim)

```powershell
scoop install yarn
```

## Step 9: Oh My Posh

```powershell
scoop bucket add extras
scoop install oh-my-posh
```

Theme in use: `clean-detailed` (already saved at `dotfiles\powershell\my_profile.omp.json`, no need to look for it again)

## Step 10: PowerShell Modules

```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force
Install-Module -Name z -Repository PSGallery -Scope CurrentUser -Force
```

> PSReadLine ships with PowerShell 7 by default — no need to install it separately.
> Check first with `Get-Module -ListAvailable -Name PSReadLine`

## Step 11: Wire up the profile to dotfiles

| Opened from                       | File used                            |
| --------------------------------- | ------------------------------------ |
| Windows Terminal (standalone app) | `Microsoft.PowerShell_profile.ps1` |

**1. Open Windows Terminal (the standalone app)** and run:

```powershell
New-Item -Path $PROFILE -Type File -Force
code $PROFILE
```

You should get the path: `C:\Users\<user>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`

**2. Both files should contain just this one line**:

```powershell
. "$HOME\Documents\dotfiles\powershell\profile.ps1"
```

(All the real config lives in the single `profile.ps1` file — no need to duplicate it in two places.)

## Step 12: Wire up the Neovim config to dotfiles

Neovim looks for its config at a fixed path: `$env:LOCALAPPDATA\nvim\init.lua`.
That file should contain just one line, pointing back to the real config in dotfiles:

```powershell
New-Item -ItemType Directory -Path "$env:LOCALAPPDATA\nvim" -Force
code "$env:LOCALAPPDATA\nvim\init.lua"
```

```lua
dofile("C:/Users/<user>/Documents/dotfiles/nvim/init.lua")
```

(All the real Neovim config — options, plugins, keymaps — lives in `dotfiles\nvim\` already.)
