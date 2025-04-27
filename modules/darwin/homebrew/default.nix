{
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.homebrew;
in {
  options.${namespace}.homebrew = {
    enable = lib.mkEnableOption "enable homebrew";
  };

  config = lib.mkIf cfg.enable {
    homebrew = {
      enable = true;
      onActivation = {
        autoUpdate = true;
        upgrade = true;
        cleanup = "zap";
      };

      brews = [
        "mas"
      ];
      masApps = {
        "Xcode" = 497799835;
      };

      casks = [
        "activitywatch"
        "appcleaner"
        "bitwarden"
        "clash-verge-rev"
        "cyberduck"
        "dbeaver-community"
        "deveco-studio"
        "discord"
        "easydict"
        "epic-games"
        "feishu"
        "firefox"
        "font-iosevka-nerd-font"
        "ghostty"
        "gitbutler"
        "godot"
        "google-chrome"
        "iina"
        "insomnia"
        "itsycal"
        "jetbrains-toolbox"
        "jordanbaird-ice"
        "logseq"
        "maccy"
        "microsoft-auto-update"
        "microsoft-edge"
        "microsoft-outlook"
        "notion"
        "notion-calendar"
        "notion-mail"
        "obsidian"
        "ogdesign-eagle"
        "onedrive"
        "opencat"
        "orbstack"
        "raycast"
        "spacedrive"
        "steam"
        "telegram-desktop"
        "the-unarchiver"
        "trae"
        "visual-studio-code"
        "wechat"
        "wetype"
        "wpsoffice-cn"
      ];
    };
  };
}
