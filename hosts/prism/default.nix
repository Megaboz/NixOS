{
    config,
    pkgs,
    ...
}: {
      #../../modules/cosmic.nix

    imports = [
      ../../modules/system.nix
      ../../modules/hyprland.nix

      ./hardware-configuration.nix
    ];
    
    # Bootloader.
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.useOSProber = true;
    
    networking.hostName = "prism";
    
    # Enable networking
    networking.networkmanager.enable = true;
    
    system.stateVersion = "25.05";
}
