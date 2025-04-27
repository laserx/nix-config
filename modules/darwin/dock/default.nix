{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.dock;
in {
  options.${namespace}.dock = {
    enable = lib.mkEnableOption "enable dock";
  };

  config = lib.mkIf cfg.enable {
    system.defaults.dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.0;
      orientation = "bottom";
      dashboard-in-overlay = true;
      largesize = 85;
      tilesize = 50;
      magnification = true;
      launchanim = false;
      mru-spaces = false;
      show-recents = false;
      show-process-indicators = false;
      static-only = true;
    };
  };
}
