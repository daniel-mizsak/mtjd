{
  config,
  currentSystemUser,
  inputs,
  ...
}:
{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = currentSystemUser;
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "lzhgus/homebrew-tap" = inputs.lzhgus-homebrew-tap;
    };
    mutableTaps = false;
    # Note: The trust entries are _not_ removed if you remove them from those lists!
    # Use the `brew untrust` command to remove a trust entry.
    trust.casks = [ "lzhgus/tap/capso" ];
  };

  # Optional: Align homebrew taps config with nix-homebrew
  homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
}
