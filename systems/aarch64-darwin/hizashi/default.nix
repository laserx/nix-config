{
  lib,
  inputs,
  namespace,
  pkgs,
  ...
}: {
  nix.enable = false;
  system.stateVersion = 6;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  me = {
    homebrew.enable = true;
    dock.enable = true;
  };

  # for all users
  environment.systemPackages = with pkgs; [
    alejandra
    tree
    snowfallorg.flake
  ];

  environment.variables = {
    # set the default editor
    EDITOR = "vim";
  };
}
