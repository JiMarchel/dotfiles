{
  description = "Bapakmu Spiderman";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
 outputs = inputs@{self, nixpkgs, home-manager, ... }: 
   let 
     lib = nixpkgs.lib;
     system = "x86_64-linux";
     pkgs = nixpkgs.legacyPackages.${system};
   in{
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        #specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
        ];
      };
    };
   homeConfigurations = {
    marchel = home-manager.lib.homeManagerConfiguration {
	inherit pkgs;
	modules = [./home.nix];
	}; 
    };

  };
}
