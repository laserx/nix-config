{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.gittools;
in {
  options.${namespace}.gittools = {
    enable = lib.mkEnableOption "enable tools for git including: git-cliff";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      git-cliff = {
        enable = true;
      };

      gitui = {
        enable = true;
      };

      gh = {
        enable = true;
      };

      gh-dash = {
        enable = true;
      };
    };
  };
}
