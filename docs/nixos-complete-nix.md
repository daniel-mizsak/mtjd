## Complete NixOS setup using Nix

Download **NixOS** ([official documentation](https://nixos.org/download.html))\
Be careful to choose the right CPU architecture.

Create new virtual machine using **Parallel Desktop** or **VirtualBox**.

Create shell where **Git** is present:
```bash
nix-shell -p git
```

**Clone** repository:
```bash
git clone https://github.com/daniel-mizsak/mtjd.git ~/mtjd
```

Run **NixOS** configuration based on CPU architecture:
```bash
sudo nixos-rebuild switch --impure --flake ~/mtjd/nix#vm-arm
```
or
```bash
sudo nixos-rebuild switch --impure --flake ~/mtjd/nix#vm-amd
```
