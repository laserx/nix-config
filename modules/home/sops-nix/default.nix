{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.sops-nix;
in {
  options.${namespace}.sops-nix = {
    enable = lib.mkEnableOption "enable sops-nix";
  };

  config = lib.mkIf cfg.enable {
    sops = {
      age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
      secrets = {
        "github_ssh_key" = {
          sopsFile = lib.snowfall.fs.get-file "secrets/laserx/default.yaml";
          path = "%r/github_ssh_key";
          mode = "0600";
        };
      };
    };

    programs.ssh = {
      enable = true;
      extraConfig = ''
        IdentityFile ${config.xdg.configHome}/sops-nix/secrets/github_ssh_key
      '';
    };

    home.packages = with pkgs; [
      sops
      age
    ];
  };
}
