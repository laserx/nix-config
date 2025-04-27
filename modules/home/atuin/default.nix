{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.atuin;
in {
  options.${namespace}.atuin = {
    enable = lib.mkEnableOption "enable atuin";
  };

  config = lib.mkIf cfg.enable {
    programs.atuin = {
      enable = true;
      enableZshIntegration = config.${namespace}.zsh.enable;
      enableFishIntegration = config.${namespace}.fish.enable;
    };
  };
}
