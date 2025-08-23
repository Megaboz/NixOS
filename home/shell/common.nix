{
    pkgs,
    ...
}:
{
  home.packages = with pkgs; [
    # Fun
    neofetch
    
    # Archivers
    zip
    unzip
    p7zip
    
    # Syntax highlighting
    chroma
    
    # Nix output monitor, provides command 'nom' which works like 'nix' but with more detailed log output
    nix-output-monitor
  ];
  
  #programs.direnv = {
  #  enable = true;
  #  nix-direnv.enable = true;
  #  enableZshIntegration = true;
  #};
}
