## Terminal Ubuntu setup using Ansible (also works on WSL2)
> [!WARNING]
> This solutions is *less* maintained than the [Nix-Darwin](macos-complete-nix.md) one.\
> Some settings/programs might be missing from this setup.

In an **Ubuntu** environment first install `build-essential` and `python3-venv`:
```bash
sudo apt update && sudo apt install build-essential python3-venv -y
```

Install **Homebrew**:
```bash
/bin/bash -c "$(curl -fsSL \
https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add **Homebrew** to your `PATH`:
```bash
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') | tee -a ${HOME}/.zshenv ${HOME}/.bashrc
```
```bash
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

Run the **terminal setup** script:
```bash
/bin/bash -c "$(curl -fsSL \
https://raw.githubusercontent.com/daniel-mizsak/mtjd/main/scripts/terminal-ansible.sh)"
```

Change the **default shell** to `zsh`:
```bash
sudo chsh -s "$(command -v zsh)" "${USER}"
```
