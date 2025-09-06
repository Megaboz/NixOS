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
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland"; # Prevents version mismatch.
    };

    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };
    
    # helix editor, use the master branch
    helix.url = "github:helix-editor/helix/master";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
      programs.zsh.enable = true;
      nixosConfigurations = {
        trinity = let
            username = "frobozz";
            specialArgs = { inherit username; };
        in
            nixpkgs.lib.nixosSystem {
              inherit specialArgs;
              system = "aarch64";
              
              modules = [
                ./hosts/trinity
                ./users/${username}/nixos.nix
                
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                
                home-manager.extraSpecialArgs = inputs // specialArgs;
                home-manager.users.${username} = import ./users/${username}/home.nix;
              }
              ];
            };
            
        prism = let
            username = "frobozz";
            specialArgs = { inherit username; };
        in
            nixpkgs.lib.nixosSystem {
              inherit specialArgs;
              system = "x86_64-linux";
              
              modules = [
                ./hosts/prism
                ./users/${username}/nixos.nix
                
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                
                home-manager.extraSpecialArgs = inputs // specialArgs;
                home-manager.users.${username} = import ./users/${username}/home.nix;
              }
              ];
            };
        
        spellbreaker = let
            username = "frobozz";
            specialArgs = { inherit username; };
        in
            nixpkgs.lib.nixosSystem {
              inherit specialArgs;
              system = "x86_64-linux";
              
              modules = [
                ./hosts/spellbreaker
                ./users/${username}/nixos.nix
                
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                
                home-manager.extraSpecialArgs = inputs // specialArgs;
                home-manager.users.${username} = import ./users/${username}/home.nix;
              }
              ];
            };
      };
  };
}
