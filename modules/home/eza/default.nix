{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.eza;
in {
  options.${namespace}.eza = {
    enable = lib.mkEnableOption "enable eza";
  };

  config = lib.mkIf cfg.enable {
    programs.eza = {
      enable = true;
      git = true;
      enableZshIntegration = config.${namespace}.zsh.enable;
      enableFishIntegration = config.${namespace}.fish.enable;
      colors = "auto";
    };
  };
}
