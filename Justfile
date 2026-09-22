@_:
    just --list --unsorted

[group("lifecycle")]
clean:
    rm -rf \
        megalinter-reports
    find . -type f -name ".DS_Store" -delete

[group("qa-extra")]
megalinter:
    npx mega-linter-runner --flavor ci_light --env "MEGALINTER_CONFIG=.github/linters/.megalinter.yml"

[group("qa-extra")]
prek:
    prek run --all-files

[group("run")]
flake-update:
    nix flake update --flake "./nix"

[group("run")]
darwin-rebuild:
    sudo darwin-rebuild switch --impure --flake "./nix#macos"

[group("run")]
nixos-rebuild:
    sudo nixos-rebuild switch --impure --flake "./nix#nixos"
