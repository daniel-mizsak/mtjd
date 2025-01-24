# Prepare environment
Write-Output 'Making sure repository is present.'
if (-Not (Test-Path -Path $env:USERPROFILE\mtjd)) {
    git clone https://github.com/daniel-mizsak/mtjd.git $env:USERPROFILE\mtjd --quiet
}
# TODO: This way the repo will be owned by the admin user and it will not use ssh for git operations.

# Install winget packages
Write-Output 'Installing winget packages.'
winget import --import-file $env:USERPROFILE\mtjd\windows\winget.json --accept-source-agreements

# Alacritty
New-Item -ItemType SymbolicLink `
    -Path $env:APPDATA\alacritty\alacritty.toml `
    -Target "$env:USERPROFILE\mtjd\dotfiles\config\alacritty\alacritty_win.toml" `
    -Force
New-Item -ItemType SymbolicLink `
    -Path $env:APPDATA\alacritty\catppuccin-mocha.toml `
    -Target "$env:USERPROFILE\mtjd\dotfiles\config\alacritty\catppuccin-mocha.toml" `
    -Force

# Bat
New-Item -ItemType SymbolicLink `
    -Path $env:APPDATA\bat `
    -Target "$env:USERPROFILE\mtjd\dotfiles\config\bat" `
    -Force

# Git
New-Item -ItemType SymbolicLink `
    -Path $env:USERPROFILE\.gitconfig `
    -Target "$env:USERPROFILE\mtjd\dotfiles\git\.gitconfig" `
    -Force
New-Item -ItemType SymbolicLink `
    -Path $env:USERPROFILE\.gitignore_global `
    -Target "$env:USERPROFILE\mtjd\dotfiles\git\.gitignore_global" `
    -Force

# Neovim
New-Item -ItemType SymbolicLink `
    -Path $env:LOCALAPPDATA\nvim `
    -Target "$env:USERPROFILE\mtjd\dotfiles\config\nvim" `
    -Force

# Powershell
Write-Output 'Setting up PowerShell profile.'
Install-PackageProvider -Name NuGet -Force -Confirm:$false
Install-Module -Name PSReadLine -Force -Confirm:$false

New-Item -ItemType SymbolicLink `
    -Path $env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 `
    -Target "$env:USERPROFILE\mtjd\dotfiles\shell\powershell\Microsoft.PowerShell_profile.ps1" `
    -Force

# VSCode
New-Item -ItemType SymbolicLink `
    -Path $env:APPDATA\Code\User\settings.json `
    -Target "$env:USERPROFILE\mtjd\dotfiles\vscode\settings.json" `
    -Force

# Wezterm
New-Item -ItemType SymbolicLink `
    -Path $env:USERPROFILE\.wezterm.lua `
    -Target "$env:USERPROFILE\mtjd\dotfiles\config\wezterm\wezterm_win.lua" `
    -Force

# Yazi
New-Item -ItemType SymbolicLink `
    -Path $env:APPDATA\yazi `
    -Target "$env:USERPROFILE\mtjd\dotfiles\config\yazi" `
    -Force
