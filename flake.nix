{
  description = "Chris Angelini's configuration for NixOS";
 
  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {

    # substituers will be appended to the default substituters when fetching packages
    # nix com    extra-substituters = [munity's cache server
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nh = {
        url = "github:nix-community/nh";
    };
    
    outputs = inputs@{
        self,
        nixpkgs,
        nix,
        nixos-hardware,
        home-manager,
        ...

    }; {
           nixosConfigurations = {
               prism = nixpkgs.lib.nixosSystem {
                   system = "x86_64-linux";
                   modules = [
                       # nixos-hardware.nixosModules.lenovo-thinkpad-x260
                       ./hosts/prism
                       ./configuration.nix
    
                       # make home-manager as a module of nixos
                       # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
                       home-manager.nixosModules.home-manager
                       ({ config, lib, ... }: {
                           home-manager.useGlobalPkgs = true;
                           home-manager.useUserPackages = true;
                           home-manager.extraSpecialArgs = {
                                inherit inputs; # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
                                inherit (config.networking) hostName;
                            };
                            home-manager.users.frobozz = {...}: {
                                imports = [
                                    ./homemanager.nix
                                    ./homemanager/xfce.nix
                                    ./homemanager/browsers.nix
                                    ./homemanager/cli-tools.nix
                                    ./homemanager/desktop-GUI-tools.nix
                                    ./homemanager/graphics.nix
                                    ./homemanager/music-playback.nix
                                    ./homemanager/python.nix
                                    ./homemanager/videos.nix
                                ]
                                ++ (lib.optional config.my.isnotebook ./homemanager/notebooks.nix)
                                ;
                            };
                        }; # end home-manager
                    ]; # end modules
               }; # end prism
           };
          
