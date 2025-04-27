{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.direnv;
in {
  options.${namespace}.direnv = {
    enable = lib.mkEnableOption "enable direnv";
  };

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    home.packages = with pkgs; [
      direnv
      nix-direnv
    ];
  };
}
