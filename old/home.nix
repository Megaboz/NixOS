{ config, pkgs, ... }:

  {
    home.username = "frobozz";
    home.homeDirectory = "/home/frobozz";

    home.packages = with pkgs; [
      # Mandatory
      neofetch

      # Archivers
      zip
      unzip
      p7zip

      # Syntax
      chroma

      # Nix output monitor, provides command 'nom' which works like 'nix' but with more detailed log output
      nix-output-monitor
    ];

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

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

      shellAliases = {
        update = "sudo nixos-rebuild switch";
        cat = "ccat";
        less = "cless";
      };
      history.size = 10000;
    };

    programs.zsh.oh-my-zsh = {
      enable = true;
      plugins = [ "git" "history-substring-search" "colored-man-pages" "colorize" ];
      theme = "fishy";
    };

    home.stateVersion = "25.05";
  }
