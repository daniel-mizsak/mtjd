# Complete macOS setup using Nix-Darwin

In a **macOS** environment first install `xcode-select`:

```bash
xcode-select --install
```

Install **Nix** ([official documentation](https://nixos.org/download/)):

```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
```

Sign in to **Apple Account**.

Enable full disk access for **Terminal** in `System Preferences > Privacy & Security > Full Disk Access > Terminal.app`.

**Clone** repository:

```bash
git clone https://github.com/daniel-mizsak/mtjd.git ~/mtjd
```

Run [`nix-darwin`](https://github.com/nix-darwin/nix-darwin):

```bash
sudo nix run nix-darwin --extra-experimental-features 'nix-command flakes' -- switch --impure --flake ~/mtjd/nix#macbook
```

Sometimes it is necessary to move some existing files. Last time these were: `/etc/nix/nix.conf`, `/etc/bashrc`, and `/etc/zshrc`.

[Apply manual settings.](macos-manual.md)

## Additional commands

After the first run, switch to the latest configuration:

```bash
sudo darwin-rebuild switch --impure --flake ~/mtjd/nix#macbook
```

To update the system:

```bash
sudo nix flake update --flake ~/mtjd/nix
```

List Nix generations:

```bash
sudo nix-env --list-generations
```

Rollback to previous generation:

```bash
sudo darwin-rebuild switch --impure --flake ~/mtjd/nix#macbook --rollback
```

Delete old generations (you may also want to run the command with `sudo`):

```bash
sudo nix-collect-garbage -d
```
