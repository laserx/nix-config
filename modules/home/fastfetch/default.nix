{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.fastfetch;
in {
  options.${namespace}.fastfetch = {
    enable = lib.mkEnableOption "enable fastfetch";
  };

  config = lib.mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;
    };
  };
}
