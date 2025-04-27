{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  home = {
    stateVersion = "24.11";
  };

  me = {
    fish.enable = true;
    zsh.enable = true;

    atuin.enable = true; # history manager
    bat.enable = true; # cat alternative with syntax highlighting
    bottom.enable = true; # resource monitor
    git.enable = true; # version control
    gittools.enable = true; # git utilities
    direnv.enable = true; # environment variable manager
    starship.enable = true; # prompt customization
    tmux.enable = true; # terminal multiplexer
    zoxide.enable = true; # directory jumper
    ghostty.enable = true; # terminal emulator
    eza.enable = true; # ls alternative
    yazi.enable = true; # file manager
    fastfetch.enable = true; # system information
    nixvim.enable = true; # nixvim configuration
    sops-nix.enable = true; # secrets management
  };
}
