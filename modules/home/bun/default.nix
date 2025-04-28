{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.bun;
in {
  options.${namespace}.bun = {
    enable = lib.mkEnableOption "enable bun";
  };

  config = lib.mkIf cfg.enable {
    programs.bun = {
      enable = true;
    };
  };
}
