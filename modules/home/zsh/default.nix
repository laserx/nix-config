{
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.zsh;
in {
  options.${namespace}.zsh = {
    enable = lib.mkEnableOption "enable zsh";
  };
  config = lib.mkIf cfg.enable {
    programs = {
      zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        history.size = 30000;
        history.save = 30000;
      };
    };
  };
}
