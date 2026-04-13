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
pre-commit:
    pre-commit run --all-files

[group("run")]
flake-update:
    nix flake update --flake "./nix"

[group("run")]
darwin-rebuild:
    sudo darwin-rebuild switch --impure --flake "./nix#macbook"
