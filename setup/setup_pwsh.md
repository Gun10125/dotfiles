# PowerShell / Windows Environment Setup Guide

Setup guide for a new machine (install steps only — config content lives in
`dotfiles\powershell\profile.ps1` already, no need to repeat it here)

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

(Neovim config setup is covered separately in `setup_nvim.md`)

## Step 7: NodeJS

```powershell
scoop install nodejs-lts
```

npm ships bundled with Node.js — no separate install needed. Verify both:

```powershell
node --version
npm --version
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

## Step 11: fzf + PSFzf (fuzzy finder in PowerShell)

`fzf` is the actual CLI tool; `PSFzf` is the PowerShell module that wires it
into the shell (history search, file search, etc.). Install both:

```powershell
scoop install fzf
Install-Module -Name PSFzf -Scope CurrentUser -Force
```

Add to the profile (see Step 12 below for where the profile lives):

```powershell
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f'
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
```

`Ctrl+f` opens fzf file search, `Ctrl+r` opens fzf command history search.

## Step 12: Wire up the profile to dotfiles

**1. Open Windows Terminal (the standalone app)** and run:

```powershell
New-Item -Path $PROFILE -Type File -Force
code $PROFILE
```

You should get the path: `C:\Users\<user>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`

**2. The file should contain just this one line**:

```powershell
. "$HOME\Documents\dotfiles\powershell\profile.ps1"
```

(All the real config lives in the single `profile.ps1` file — no need to duplicate it anywhere else.)

---
