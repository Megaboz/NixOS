{ config, pkgs, username, ... }:
{
      programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history.size = 10000;

      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch --flake /home/${username}/nixos-config";
        cow = "cowsay";
      };

      plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.7.1";
            sha256 = "02p5wq93i12w41cw6b00hcgmkc8k80aqzcy51qfzi0armxig555y";
        };
      }
      ];
    };
    
    programs.zsh.oh-my-zsh = {
      enable = true;
      plugins = [ "git" "history-substring-search" "colored-man-pages" "colorize" ];
      theme = "fishy";
    };
}
