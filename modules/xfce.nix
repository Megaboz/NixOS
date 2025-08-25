{config, lib, pkgs, ...}: {

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  # Configure Xfce4 desktop manager
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;

  programs.xfconf.enable = true;

  # Set up Xfce packages
  environment.systemPackages = with pkgs; [
    xclip
    xfce.xfce4-dict
    autokey
    gnome-icon-theme
    dejavu_fonts
    gentium
    yanone-kaffeesatz
    wmctrl
    gnome-keyring
    xfce.xfwm4-themes
    xfce.thunar
    xfce.thunar-volman
    xfce.xfce4-appfinder
    xfce.xfce4-clipman-plugin
    xfce.xfce4-cpugraph-plugin
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-weather-plugin
    xfce.xfce4-netload-plugin
    xfce.xfce4-notes-plugin
    xfce.xfce4-notifyd
    xfce.xfce4-power-manager
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-screensaver
    xfce.xfce4-screenshooter
    xfce.xfce4-session
    xfce.xfce4-settings
    xfce.xfce4-systemload-plugin
    xfce.xfce4-taskmanager
    xfce.xfce4-terminal
    xfce.xfce4-verve-plugin
    brightnessctl
  ];

}
