{config, ...}: let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./zsh
    ./common.nix
    # ./terminals.nix
  ];
  
  # Environmental variables
  home.sessionVariables = {
      LESSHISTFILE = cache + "/less/history";
      LESSKEY = c + "/less/lesskey";
      # WINEPREFIX = d + "/wine";  
      
      # Default applications
      EDITOR = "nano";
      BROWSER = "firefox";
      TERMINAL = "xfce4-terminal";
  };
  
  home.shellAliases = {
    cat = "ccat";
    less = "cless";
  };
}
