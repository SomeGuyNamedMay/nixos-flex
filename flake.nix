{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, stylix }: {
    nixosConfigurations.flex = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
        {
          stylix.enable = true;
          stylix.base16Scheme = "${nixpkgs.legacyPackages.x86_64-linux.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
        }
        {
          home-manager.useGlobalPkgs = true;
          home-manager.users.may = import ./home/may;
        } 
        ./system/flex/configuration.nix 
      ];
    };
  };
}

