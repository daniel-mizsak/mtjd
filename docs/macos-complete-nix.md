## Complete macOS setup using Nix-Darwin

In a **macOS** environment first install `xcode-select`:
```bash
xcode-select --install
```

Install **Nix** ([official documentation](https://nixos.org/download/)):
```bash
sh <(curl -L https://nixos.org/nix/install)
```

Enable **Nix Flakes** in `~/.config/nix/nix.conf`:
```bash
mkdir -p ~/.config/nix
cat <<EOF > ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF
```

Sign in to **Apple Account**.

Enable full disk access for **Terminal** in `System Preferences > Privacy & Security > Full Disk Access`.

**Clone** repository:
```bash
git clone https://github.com/daniel-mizsak/mtjd.git ~/mtjd
```

Run [`nix-darwin`](https://github.com/LnL7/nix-darwin):
```bash
nix run nix-darwin -- switch --impure --flake ~/mtjd/nix#macbook
```

Apply **manual settings** detailed [here](macos-manual-settings.md).

## Additional commands

After the first run, switches can be done with:
```bash
darwin-rebuild switch --impure --flake ~/mtjd/nix#macbook
```

To update the system:
```bash
❯ nix flake update --flake ~/mtjd/nix
```

List Nix generations:
```bash
nix-env --list-generations
```

Rollback to a specific previous generation:
```bash
darwin-rebuild switch --impure --flake ~/mtjd/nix#macbook --rollback
```

Delete old generations (you may also want to run the command with `sudo`):
```bash
nix-collect-garbage -d
```
