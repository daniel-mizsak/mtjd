## Complete macOS setup using Ansible
> [!WARNING]
> This solutions is *less* maintained than the [Nix-Darwin](macos-complete-nix.md) one.\
> Some settings/programs might be missing from this setup.

In a **macOS** environment first install `xcode-select`.
```bash
xcode-select --install
```

Install **Homebrew**:
```bash
/bin/bash -c "$(curl -fsSL \
https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add **Homebrew** to your `PATH`:
```bash
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ${HOME}/.zshenv
```
```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Sign in to **Apple Account**.

Enable full disk access for **Terminal** in `System Preferences > Privacy & Security > Full Disk Access`.

Run the **macos setup** script:
```bash
/bin/bash -c "$(curl -fsSL \
https://raw.githubusercontent.com/daniel-mizsak/mtjd/main/scripts/macos-complete-ansible.sh)"
```

Apply **manual settings** detailed [here](macos-manual.md).
