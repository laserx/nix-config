{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.zoxide;
in {
  options.${namespace}.zoxide = {
    enable = lib.mkEnableOption "enable zoxide";
  };

  config = lib.mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = config.${namespace}.zsh.enable;
      enableFishIntegration = config.${namespace}.fish.enable;
    };
  };
}
