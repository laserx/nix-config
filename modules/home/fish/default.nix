{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.fish;
in {
  options.${namespace}.fish = {
    enable = lib.mkEnableOption "enable fish shell";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      fish = {
        enable = true;
        plugins = [
          {
            name = "gitnow";
            src = pkgs.fetchFromGitHub {
              owner = "joseluisq";
              repo = "gitnow";
              rev = "2.13.0";
              sha256 = "sha256-F0dTu/4XNvmDfxLRJ+dbkmhB3a8aLmbHuI3Yq2XmxoI=";
            };
          }
        ];
      };
    };
  };
}
