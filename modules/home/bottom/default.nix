{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.bottom;
in {
  options.${namespace}.bottom = {
    enable = lib.mkEnableOption "enable bottom";
  };

  config = lib.mkIf cfg.enable {
    programs.bottom = {
      enable = true;

      settings = {
        styles = {
          theme = "nord-light";
        };
      };
    };
  };
}
