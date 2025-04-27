{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.bat;
in {
  options.${namespace}.bat = {
    enable = lib.mkEnableOption "enable bat";
  };

  config = lib.mkIf cfg.enable {
    programs.bat = {
      enable = true;
    };
  };
}
