{pkgs, ...}: {
    # Home manager configuration for Chris Angelini/frobozz
    
    imports = [
      ../../home/core.nix
      ../../home/hyprland/frobozz.nix
      ../../home/applications/frobozz/cli.nix
      ../../home/applications/frobozz/gui-tools.nix
      ../../home/applications/frobozz/gaming.nix
      ../../home/applications/frobozz/graphics.nix
      ../../home/applications/frobozz/music.nix
      ../../home/applications/frobozz/python.nix
      ../../home/applications/frobozz/videos.nix
      ../../home/shell

      ../../configs/frobozz/tmux.nix
    ];
    
    programs.git = {
      enable = true;
      userName = "Chris Angelini";
      userEmail = "megaboz@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };  
    };
}
