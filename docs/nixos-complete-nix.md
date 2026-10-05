# Complete NixOS setup using Nix

Download **NixOS** ([official documentation](https://nixos.org/download.html))\
Be careful to choose the right CPU architecture.

Install NixOS on the target machine, whether it is a physical computer or a virtual machine such as **Parallels Desktop** or **UTM**.

Enable **Nix Flakes** in `~/.config/nix/nix.conf`:

```bash
mkdir -p ~/.config/nix
cat <<EOF > ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF
```

Create shell where **Git** is present:

```bash
nix-shell --packages git
```

**Clone** repository:

```bash
git clone https://github.com/daniel-mizsak/mtjd.git ~/mtjd
```

Run the **NixOS** configuration on the machine being configured:

```bash
sudo nixos-rebuild switch --impure --flake ~/mtjd/nix#nixos
```

## Additional commands

Switch to the latest configuration:

```bash
sudo nixos-rebuild switch --impure --flake ~/mtjd/nix#nixos
```

To update the system:

```bash
sudo nix flake update --flake ~/mtjd/nix
```

List Nix generations:

```bash
sudo nixos-rebuild list-generations
```

Rollback to previous generation:

```bash
sudo nixos-rebuild switch --impure --flake ~/mtjd/nix#nixos --rollback
```

Delete old generations:

```bash
sudo nix-collect-garbage -d
```
