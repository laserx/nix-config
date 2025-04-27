{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.tmux;
in {
  options.${namespace}.tmux = {
    enable = lib.mkEnableOption "enable tmux";
  };

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      clock24 = true;
      baseIndex = 1;
      historyLimit = 50000;
      mouse = true;
      shortcut = "f";
      terminal = "tmux-256color";

      plugins = with pkgs; [
        tmuxPlugins.better-mouse-mode
        tmuxPlugins.rose-pine
      ];

      extraConfig = ''
        set -g default-shell ${pkgs.fish}/bin/fish

        set -ga terminal-overrides ",*256col*:Tc"
        set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
        set-environment -g COLORTERM "truecolor"

        # reload config
        unbind r
        bind r source-file ${config.xdg.configHome}/tmux/tmux.conf \; display "Reloaded TMUX Config"

        set -g @rose_pine_variant 'dawn'

        # have to reset the terminal after changing the theme
        run-shell "${pkgs.tmuxPlugins.rose-pine}/share/tmux-plugins/rose-pine/rose-pine.tmux"
      '';
    };
  };
}
