{pkgs, ...}: {
    # Home manager configuration for Chris Angelini/frobozz
    
    imports = [
      ../../home/core.nix
      ../../home/xfce/frobozz.nix
      ../../home/applications/frobozz/cli.nix
      ../../home/applications/frobozz/gui-tools.nix
      ../../home/shell
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
