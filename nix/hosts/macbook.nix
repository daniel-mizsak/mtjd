{
  pkgs,
  currentSystemUser,
  ...
}: {
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    primaryUser = currentSystemUser;

    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
      };
      controlcenter = {
        BatteryShowPercentage = true;
      };
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        launchanim = true;
        magnification = false;
        mineffect = "genie";
        minimize-to-application = false;
        mru-spaces = false;
        orientation = "bottom";
        show-process-indicators = true;
        show-recents = false;
        tilesize = 60;
        persistent-apps = [
          "/Applications/Vivaldi.app"
          "/Applications/Signal.app"
          "/Applications/Visual\ Studio\ Code.app"
          "/System/Applications/System Settings.app"
        ];
        persistent-others = ["/Users/${currentSystemUser}/Downloads/"];
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "clmv";
        FXRemoveOldTrashItems = false;
        NewWindowTarget = "Documents";
        QuitMenuItem = true;
        ShowExternalHardDrivesOnDesktop = true;
        ShowHardDrivesOnDesktop = false;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      menuExtraClock = {
        FlashDateSeparators = false;
        Show24Hour = true;
        ShowDate = 2;
        ShowDayOfWeek = true;
      };
      CustomUserPreferences = {
        "com.apple.desktopservices".DSDontWriteNetworkStores = true;
        "com.apple.dock" = {
          contents-immutable = true;
          size-immutable = true;
        };
        "com.apple.finder" = {
          ShowRecentTags = false;
          ShowToolbar = true;
          WarnOnEmptyTrash = false;
        };
      };
      ".GlobalPreferences" = {
        "com.apple.mouse.scaling" = 1.8;
      };
      WindowManager.EnableStandardClickToShowDesktop = false;
    };

    stateVersion = 5;
  };

  time.timeZone = "Europe/Budapest";
  programs.fish.enable = true;

  users = {
    knownUsers = [currentSystemUser];

    users.${currentSystemUser} = {
      name = currentSystemUser;
      uid = 501;
      home = "/Users/${currentSystemUser}";
      shell = pkgs.fish;
    };
  };
}
