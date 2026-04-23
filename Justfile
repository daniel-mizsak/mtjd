@_:
    just --list --unsorted

[group("lifecycle")]
clean:
    rm -rf \
        megalinter-reports
    find . -name ".DS_Store" -type f -delete

[group("qa-extra")]
megalinter:
    npx mega-linter-runner --flavor cupcake --env "MEGALINTER_CONFIG=.github/linters/.megalinter.yml"

[group("qa-extra")]
prek:
    prek run --all-files

[group("run")]
flake-update:
    nix flake update --flake "./nix"

[group("run")]
darwin-rebuild:
    sudo darwin-rebuild switch --impure --flake "./nix#macbook"

[group("run")]
nixos-rebuild-amd:
    sudo nixos-rebuild switch --impure --flake "./nix#vm-amd"

[group("run")]
nixos-rebuild-arm:
    sudo nixos-rebuild switch --impure --flake "./nix#vm-arm"
