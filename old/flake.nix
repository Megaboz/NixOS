{
  description = "Chris Angelini's configuration for NixOS";

  inputs = {
    # Use the official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # helix editor, use the master branch
    helix.url = "github:helix-editor/helix/master";

    # Use home manager to manage your home
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager,... }: {
    nixosConfigurations.prism = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        # Source the original configuration
        ./configuration.nix

        # Make home-manager a module of system to deploy automatically.
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.frobozz = import ./home.nix;
        }
      ];
    };
    
  };


}
