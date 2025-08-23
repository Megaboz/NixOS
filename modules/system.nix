{
  pkgs,
  lib,
  username,
  ...
}: {
    # Define user account.
    users.users.${username} = {
      isNormalUser = true;
      description = username;
      extraGroups = ["networkmanager" "wheel"];  
    };
    
    # Allow users in this list the right to specify additional substituters
    nix.settings.trusted-users = [username];
    
    # Declaratively customize nix.conf via nix.settings
    nix.settings = {
      # enable flakes globally
      experimental-features = ["nix-command" "flakes"];
      
      substituters = [
        "https://cache.nixos.org"
      ];
      
      # Public keys to trust for substituters
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
      builders-use-substitutes = true;
    };

    # Weekly garbage collection to reduce disk usage
    nix.gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 7d";  
    };
    
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    
    # Set your time zone.
    time.timeZone = "America/Los_Angeles";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
 
    # List services that you want to enable:
    
    # Enable CUPS
    services.printing.enable = true;
    

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;
    services.openssh.settings.PermitRootLogin = "no";
    services.openssh.settings.PasswordAuthentication = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
    
    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      nano
      wget
      git
      
    ];
    # Globally install Zsh
    programs.zsh.enable = true;

    # Globally install oh my zsh
    programs.zsh.ohMyZsh.enable = true;
}
