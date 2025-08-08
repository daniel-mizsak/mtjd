# Terminal macOS setup using Ansible

> [!WARNING]
> This solutions is _less_ maintained than the [Nix-Darwin](macos-complete-nix.md) one.\
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

Run the **terminal setup** script:

```bash
/bin/bash -c "$(curl -fsSL \
https://raw.githubusercontent.com/daniel-mizsak/mtjd/main/scripts/terminal-ansible.sh)"
```
