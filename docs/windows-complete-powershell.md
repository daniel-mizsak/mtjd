# Complete Windows setup using Powershell

> [!WARNING]
> This solutions is not very well maintained.\
> It is also limited compared to other solutions.

Definitely do not **activate Windows** using something like [massgrave.dev](https://massgrave.dev/).

Start **PowerShell** as administrator and allow **script execution**:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

Optionally **debloat** Windows using [Win11Debloat](https://github.com/Raphire/Win11Debloat)

```powershell
& ([scriptblock]::Create((irm "https://win11debloat.raphi.re/"))) `
    -RunDefaults  -RemoveGamingApps -ShowHiddenFolders `
    -RevertContextMenu -Silent
```

Install **Git** from **WinGet**:

```powershell
winget install --id Git.Git -e --source winget
```

Reopen **PowerShell** as administrator and run the **windows setup** script:

```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/daniel-mizsak/mtjd/main/scripts/windows-complete-powershell.ps1'))
```

Since the script installed `PowerShell 7`, it can be used by opening `pwsh` instead of `powershell`.
The installed terminal emulators also default to `pwsh`.

Reopen **PowerShell** as administrator and install **Nerd Fonts**:

```powershell
oh-my-posh font install Meslo
```

And add theme for **bat**:

```powershell
bat cache --build
```

Install **wsl** if Windows is not running in a virtual machine:

```powershell
wsl --install
```
