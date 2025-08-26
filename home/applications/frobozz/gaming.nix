{ config, pkgs, lib, ... }:
{
    home.packages = with pkgs; [
        bluez
        blueman
        hidapi
        bluez-tools
        
        steam
    ];
}
