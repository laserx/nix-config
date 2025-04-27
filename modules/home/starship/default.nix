{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.starship;
in {
  options.${namespace}.starship = {
    enable = lib.mkEnableOption "enable starship";
  };

  config = lib.mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = config.${namespace}.zsh.enable;
      enableFishIntegration = config.${namespace}.fish.enable;

      settings = {
        aws.symbol = "🅰 ";
        bun.symbol = "🅱 ";
        lua.symbol = "🅻 ";
        golang.symbol = "🅶 ";
        ruby.symbol = "🅡 ";
        python.symbol = "🅟 ";
      };
    };
  };
}
