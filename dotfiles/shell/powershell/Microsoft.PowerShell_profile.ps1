##### General #####
$env:EDITOR = "nvim"

# Powershell Autosuggestions
# https://learn.microsoft.com/en-us/powershell/scripting/learn/shell/using-predictors?view=powershell-7.4
Get-PSReadLineOption | Select-Object -Property History


##### Tools #####
# Bat
# https://github.com/sharkdp/bat
$env:BAT_THEME = "Catppuccin Mocha"

# Direnv
# https://direnv.net
$env:DIRENV_CONFIG=$env:APPDATA +  "\direnv\conf"
$env:XDG_CACHE_HOME=$env:APPDATA + "\direnv\cache"
$env:XDG_DATA_HOME=$env:APPDATA + "\direnv\data"
$env:PATH += ";C:\Program Files\Git\bin"
Invoke-Expression "$(direnv hook pwsh)"

# Oh-My-Posh
# https://ohmyposh.dev/docs/installation/prompt
oh-my-posh init pwsh --config $env:USERPROFILE\mtjd\dotfiles\config\oh-my-posh\oh-my-posh.toml | Invoke-Expression

# Yazy
# https://yazi-rs.github.io/docs/installation/#install-with-winget
$env:YAZI_FILE_ONE = "C:\Program Files\Git\usr\bin\file.exe"

# Zoxide
# https://github.com/ajeetdsouza/zoxide
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })

##### Alias #####
Set-Alias -Name cat -Value "bat" -Option AllScope

function Invoke-Eza
{
    eza --color=always --all --icons=always @args
}
function Invoke-EzaLong
{
    Invoke-Eza --long @args
}
Set-Alias ls -Value Invoke-Eza -Option AllScope
Set-Alias ll -Value Invoke-EzaLong -Option AllScope