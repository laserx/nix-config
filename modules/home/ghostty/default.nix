{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.ghostty;
in {
  options.${namespace}.ghostty = {
    enable = lib.mkEnableOption "enable ghostty";
  };

  config = lib.mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      package = null;
      settings = {
        theme = "Violet Light";
        font-size = 16;
        font-family = "Iosevka Nerd Font";
        keybind = [
          "super+t=unbind"
        ];
      };
    };
  };
}
