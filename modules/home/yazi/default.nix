{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.yazi;
in {
  options.${namespace}.yazi = {
    enable = lib.mkEnableOption "enable yazi";
  };

  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = config.${namespace}.zsh.enable;
      enableFishIntegration = config.${namespace}.fish.enable;
    };
  };
}
