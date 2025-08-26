{ config, pkgs, lib, ... }:
{
    home.packages = with pkgs; [
        python3Full
        python3Packages.pip
        virtualenv
    ];
}
