
# Neovim Setup Guide

Setup guide for a new machine (install steps only — config content lives in
`dotfiles\nvim\` already, no need to repeat it here). Assumes Neovim and Vim
are already installed via `setup_pwsh.md` Step 6.

## Step 1: Search tools required by plugins

Some plugins (snacks.nvim's Find File, Telescope-style pickers) shell out to
external CLI tools instead of using Windows' built-in `find`.

```powershell
scoop install fd
fd --version
```

(Optional, add later if using Telescope live-grep: `scoop install ripgrep`)

## Step 2: Wire up the Neovim config to dotfiles

Neovim looks for its config at a fixed path: `$env:LOCALAPPDATA\nvim\init.lua`.
That file should contain just one line, pointing back to the real config in dotfiles:

```powershell
New-Item -ItemType Directory -Path "$env:LOCALAPPDATA\nvim" -Force
code "$env:LOCALAPPDATA\nvim\init.lua"
```

```lua
dofile("C:/Users/<user>/Documents/dotfiles/nvim/init.lua")
```

(All the real Neovim config — options, plugins, keymaps, colors — lives in
`dotfiles\nvim\` already.)

## Step 3: Folder structure (modular Lua config)

```
dotfiles/
└── nvim/
    ├── init.lua                  ← entry point, just requires the files below
    └── lua/
        ├── config/
        │   ├── options.lua       ← vim.opt settings (tabstop, mouse, etc.)
        │   ├── plugins.lua       ← lazy.nvim bootstrap + import plugins/
        │   ├── keymaps.lua       ← keybindings (NERDTree toggle, etc.)
        │   └── colors.lua        ← custom colorscheme (dark + transparent)
        └── plugins/
            ├── snacks.lua        ← dashboard
            ├── nerdtree.lua      ← file explorer
            ├── lualine.lua       ← statusline
            └── ...               ← one file per plugin
```

`init.lua` at the root only needs:

```lua
vim.opt.rtp:prepend(vim.fn.expand("~/Documents/dotfiles/nvim"))

require("config.options")
require("config.plugins")
require("config.keymaps")
require("config.colors")
```

## Step 4: Plugin manager (lazy.nvim)

Bootstrapped automatically inside `plugins.lua` — no manual install needed,
it clones itself on first run. Plugins currently in use:

- `folke/snacks.nvim` — dashboard (custom OMEGA ASCII header)
- `preservim/nerdtree` — file explorer (`Ctrl+N` / `Ctrl+T` / `Ctrl+F`)
- `nvim-lualine/lualine.nvim` — statusline

> Note: `vim.opt.rtp:prepend(...)` in `init.lua` must run **before**
> `require("lazy").setup(...)`. Pass `{ performance = { rtp = { reset = false } } }`
> as the second argument to `lazy.setup()`, otherwise lazy.nvim resets the
> runtimepath and later `require("config.*")` calls will fail to find files.

## Step 5: Custom colorscheme

Dark theme with transparent background, written by hand in `colors.lua`
(no external theme plugin — full control over every highlight group).
Requires the terminal itself to have transparency/acrylic enabled
(Windows Terminal → Settings → Appearance → Enable acrylic material).

## Step 6: Test

```powershell
nvim
```

Should show the dashboard with the OMEGA header. Press `Ctrl+T` to toggle
the file tree, `f` to fuzzy-find files (requires `fd` from Step 1).
