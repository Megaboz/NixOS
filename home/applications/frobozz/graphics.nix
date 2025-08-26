{ config, pkgs, lib, ... }:
{
    home.packages = with pkgs; [
        gimp-with-plugins
        imagemagick
    ];
}
