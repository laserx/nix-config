{
  lib,
  inputs,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.nixvim;
in {
  options.${namespace}.nixvim = {
    enable = lib.mkEnableOption "enable nixvim";
  };

  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
    };
  };
}
