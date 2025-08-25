{ config, pkgs, lib, ... }:
{
    home.packages = with pkgs; [
        corefonts
        libreoffice
        keepassxc
        lm_sensors
        ntp
        pdfgrep
        pdftk
        w3m
        dia
        calibre
        geany
        nix-output-monitor
        dosbox
        libnotify
        
        scrcpy
        android-tools
        android-udev-rules
        
        blanket
        firefox
    ];
    
}
