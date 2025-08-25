{ config, pkgs, lib, ... }:
{
    home.packages = with pkgs; [
        pavucontrol
        flac
        id3v2
        puddletag
        lame
        strawberry
    ];
}
