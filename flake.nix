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
      marchel = lib.nixosSystem {
        inherit system;
        #specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
	home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true; # Opsional, tapi sering berguna
          home-manager.useUserPackages = true;
          # Ganti "usernameanda" dengan nama pengguna Anda yang sebenarnya
          home-manager.users.marchel = import ./home/default.nix; # Path ke file konfigurasi home.nix Anda

          # Atau jika Anda ingin mendefinisikan konfigurasi HM inline (kurang umum untuk config besar)
          # home-manager.users.usernameanda = { pkgs, ... }: {
          #   home.packages = [ pkgs.kitty ];
          #   programs.hyprland.enable = true;
          #   # ... konfigurasi HM lainnya ...
          # };

          # Jika Anda menggunakan `extraSpecialArgs` untuk Home Manager
          # home-manager.extraSpecialArgs = { inherit inputs; /* argumen lain */ };
        }
        ];
      };
    };
   #homeConfigurations = {
   # marchel = home-manager.lib.homeManagerConfiguration {
#	inherit pkgs;
#	modules = [./home/default.nix];
#	}; 
 #   };

  };
}
