# Alias
Set-Alias ll ls
Set-Alias g git

function gb { git branch }
function gs { git status }
function ga { git add . }
function gc { param($msg) git commit -m "$msg" }
function gp { git push origin (git branch --show-current) }

# Oh My Posh prompt theme
oh-my-posh init pwsh --config "$HOME\Documents\dotfiles\powershell\my_profile.omp.json" | Invoke-Expression

# Terminal Icon
Import-Module -Name Terminal-Icons

# Directory jumper
Import-Module -Name z

# History & Autocomplete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Utility: find full path of a command
Set-Alias w whereis
function whereis {
    param([string]$name)
    Get-Command $name -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source
}