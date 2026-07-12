# Windows Dev Environment Setup Guide

คู่มือติดตั้งเครื่องใหม่ (เฉพาะขั้นตอน install — ส่วน config อยู่ใน
`dotfiles\powershell\profile.ps1` และ `dotfiles\nvim\init.vim` อยู่แล้ว ไม่ต้องพิมพ์ซ้ำ)

## Step 1: PowerShell Core 7

ติดตั้งผ่าน Microsoft Store (ค้นหา "PowerShell") หรือ:

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

## Step 4: Git (ต้องลงก่อน เพราะ scoop ใช้ git ในการเพิ่ม bucket)

```powershell
scoop install git
```

## Step 5: Nerd Font

```powershell
scoop bucket add nerd-fonts
scoop install Hack-NF
```

ตั้งค่า Windows Terminal / VS Code terminal ให้ใช้ font: `Hack Nerd Font Mono`

## Step 6: Neovim + Vim

```powershell
scoop install neovim
scoop install vim
```

## Step 7: vim-plug (plugin manager สำหรับ Neovim)

```powershell
$plugPath = "$env:LOCALAPPDATA\nvim-data\site\autoload\plug.vim"
New-Item -ItemType Directory -Path (Split-Path $plugPath) -Force | Out-Null
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" -OutFile $plugPath
```

เปิด `nvim` แล้วรัน `:PlugInstall` เมื่อพร้อมลง plugin ตามใน `init.vim`

## Step 8: SSH Key (สำหรับ push ขึ้น GitHub)

```powershell
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Copy public key ไปใส่ใน GitHub → Settings → SSH and GPG keys:

```powershell
Get-Content $HOME\.ssh\id_ed25519.pub | Set-Clipboard
```

ทดสอบเชื่อมต่อ:

```powershell
ssh -T git@github.com
```

## Step 9: NodeJS

```powershell
scoop install nodejs-lts
```

## Step 10: Yarn (สำหรับ coc.nvim)

```powershell
scoop install yarn
```

## Step 11: Oh My Posh

```powershell
scoop bucket add extras
scoop install oh-my-posh
```

Theme ที่ใช้: `clean-detailed` (ไฟล์อยู่ใน `dotfiles\powershell\my_profile.omp.json` แล้ว ไม่ต้องหาใหม่)

## Step 12: PowerShell Modules

```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force
Install-Module -Name z -Repository PSGallery -Scope CurrentUser -Force
```

> PSReadLine ปกติติดมากับ PowerShell 7 อยู่แล้ว ไม่ต้องลงเพิ่ม
> เช็คก่อนด้วย `Get-Module -ListAvailable -Name PSReadLine`

## Step 13: เชื่อม Profile เข้ากับ dotfiles

ทั้ง `Microsoft.PowerShell_profile.ps1` (Windows Terminal) และ
`Microsoft.VSCode_profile.ps1` (VS Code terminal) ให้มีแค่บรรทัดเดียว:

```powershell
. "$HOME\Documents\dotfiles\powershell\profile.ps1"
```

(เนื้อหา config จริงทั้งหมดอยู่ใน `profile.ps1` ไฟล์เดียว ไม่ต้องซ้ำสองที่)

---

## ตอนย้ายเครื่องใหม่ / clone กลับมา

```powershell
git clone git@github.com:Gun10125/dotfiles.git $HOME\Documents\dotfiles
cd $HOME\Documents\dotfiles
scoop import scoopfile.json
```

จากนั้นสร้างไฟล์ profile สั้นๆ 2 ไฟล์ (Step 13) ให้ชี้กลับมาที่ `profile.ps1`
และทำ Step 7 (vim-plug) ใหม่อีกครั้ง เพราะ `nvim-data` ไม่ได้อยู่ใน git repo
