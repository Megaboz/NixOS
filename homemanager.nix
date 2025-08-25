{ config, pkgs, lib, inputs, ... }:

{
    nixpkgs.config.allowUnfree = true;
    
    home.packages = with pkgs; [
        hicolor-icon-theme
        inputs.nh.packages.${pkgs.sytem}.default
    ];
    
    home.sessionVariables.NH_FLAKE = "/home/frobozz/nixos";
    
    gtk = {
        enable = true;
        theme = {
            name = "Adwaita";
            package =  pkgs.adwaita-icon-theme;
        };
    };
    
    xdg = {
        enable = true;
    };
}
