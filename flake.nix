{
  description = "This is my first system build using flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Check if you need to add the release version or not
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations = {
      x1 = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        modules = [ 
          ./hosts/x1.nix 
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.hazaa = import ./modules/home.nix;
          }
        ];
      };
    };
  };
}
