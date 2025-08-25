# This is a Nix configuration file that contains ALL SETTINGS shared by ALL HOSTS:

{ config, pkgs, ... }:

{
    imports = [
        ./customOptions.nix
        ./xfce.nix
    ];
    
    ## https://nixos.wiki/wiki/Flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    ## This is the default, but it's here just for completeness.
    nix.daemonCPUSchedPolicy = "other";
    
    # Weekly garbage collection to reduce disk usage
    nix.gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 7d";  
    };
    
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
    
    # Enable the X11 windowing system.
    services.xserver.enable = true
    
    # Configure keymap in X11
    services.xserver = {
        xkb.layout = "us";
        xkb.variant = "intl";
        xkb.options = ""; # Configure keymap in X11
    };
    
    # Configure console keymap
    # console.keyMap = "us-acentos";
    
    systemd.sleep.extraConfig = "HibernateDelaySec=30m"; # from: https://github.com/NixOS/nixos-hardware/issues/672
    
    # Enable sound with pipewire.
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;
    };
    
    # Define the frobozz user account. This is my standard account on every machine I use.
    users.users.frobozz = {
        isNormalUser = true;
        description = "Chris Angelini";
        extraGroups = [ "wheel" "networkmanager" "docker" ];
        shell = pkgs.zsh;
        packages = with pkgs; [
            firefox
        ];
    };
    
    security.sudo.extraConfig = ''
                             Defaults        timestamp_timeout=60
    '';
    
    # Globally install zsh
    programs.zsh.enable = true;
    
    # Globally install oh my zsh
    programs.zsh.ohMyZsh.enable = true;
    
    # Install the android developer tools
    programs.adb.enable = true;
    
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    
    # TODO: This sits wrong with me. We need to change frobozz to $username. Only not fixing it right now because I want the initial config to not break.
    environment.variables = {
        EDITOR = "nano";
        PATH = "$PATH:/home/frobozz/bin";
        DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";  
    };
    
    # Packages to install in the system profile. `nix search wget`
    environment.systemPackages = with  pkgs; [
        nano
        vim
        screen
        tmux
        syncthing
        cron
        tailscale
        fwupd
    ];
    
    # Enable services
    
    services.tailscale.enable = true;
    services.fwupd.enable = true;
    
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #     enable = true;
    #     enableSSHSupport = true;
    #     #pinentryFlavor = "gtk2"; ## 2024-06-01: not available with NixOS 24.05 any more
    #     pinentryPackage= pkgs.pinentry-gtk2; 
    # };
    # services.pcscd.enable = true;  
    ## 2023-09-04: in order to avoid "No pinentry program" see also setting for home.file.".gnupg/gpg-agent.conf" in cli-tools.nix!
    
    
}
