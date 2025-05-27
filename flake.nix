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
    nvf = {
      url = "github:notashelf/nvf";
    };
    stylix.url = "github:danth/stylix";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nvf,
    stylix,
    ...
  }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };
  in {
    nixosConfigurations = {
      marchel = lib.nixosSystem {
        inherit pkgs;
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true; # Opsional, tapi sering berguna
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs pkgs;};
            home-manager.users.marchel = import ./home/default.nix; # Path ke file konfigurasi home.nix Anda
          }
        ];
      };
    };
  };
}
