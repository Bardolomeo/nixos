{
  inputs = {
		description = "My NixOS Flake";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
 

    nix-fast-build = {
    	url = "github:Mic92/nix-fast-build";
        inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, nix-fast-build, nixvim, ... } @inputs : {

	nixosConfigurations.nightqu33n = nixpkgs.lib.nixosSystem {		

        modules = [
          ./configuration.nix
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # TODO replace ryan with your own username
						home-manager.users.magigraph = import ./home.nix;
            home-manager.users.root = import ./root.nix;
						
# Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }


        ];

      };
    };
  
}
