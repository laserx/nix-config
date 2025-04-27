{
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.git;
in {
  options.${namespace}.git = {
    enable = lib.mkEnableOption "enable git";
  };
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "laserx";
      userEmail = "laserxie@outlook.com";

      delta.enable = true;

      aliases = {
        st = "status";
        co = "checkout";
        cm = "commit";
        br = "branch";
        unstage = "reset HEAD";
        last = "log -1";
        lga = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --decorate --stat --all";
        lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --decorate --max-count=10";
      };
      extraConfig = {
        core = {
          editor = "vim";
          compression = 0;
        };

        delta = {
          side-by-side = true;
          line-numbers = true;
          navigate = true;
          hyperlinks = true;
          hyperlinks-file-link-format = "vscode://file/{path}:{line}";
        };
        merge = {
          conflictstyle = "zdiff3";
        };
        push = {
          default = "simple";
        };
        init = {
          defaultBranch = "main";
        };
      };
    };
  };
}
