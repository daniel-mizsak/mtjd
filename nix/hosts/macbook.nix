{currentSystemUser, ...}: {
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    stateVersion = 5;

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
        NewWindowTarget = "PfDo";
        NewWindowTargetPath = "file://Users/${currentSystemUser}/Documents/";
        QuitMenuItem = true;
        ShowExternalHardDrivesOnDesktop = true;
        ShowHardDrivesOnDesktop = false;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      menuExtraClock = {
        FlashDateSeparators = false;
        Show24Hour = true;
        # ShowDate = true;
        # ShowDayOfWeek = true;
        # ShowDayOfMonth = true;
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
      WindowManager.EnableStandardClickToShowDesktop = false;
    };
  };

  system.primaryUser = currentSystemUser;
  time.timeZone = "Europe/Budapest";
  users.users.${currentSystemUser} = {
    name = currentSystemUser;
    home = "/Users/${currentSystemUser}";
  };
}
