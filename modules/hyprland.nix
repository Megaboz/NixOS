{config, pkgs, ... }:
{
  
  # Configure Xfce4 desktop manager
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
  };

    environment.systemPackages = with pkgs; [
       hyprland
       kitty
       waybar
       wofi
       nwg-look
    ];

    programs.hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
    };

}
