{
  description = "Laserx nix flake system configuration powered by snowfall lib";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snowfall-flake = {
      url = "github:snowfallorg/flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: let
    inherit (inputs) snowfall-lib;

    lib = inputs.snowfall-lib.mkLib {
      inherit inputs;
      src = ./.;

      snowfall = {
        namespace = "me";

        meta = {
          name = "me";

          title = "me";
        };
      };
    };
  in
    lib.mkFlake {
      channels-config = {
        allowUnfree = true;
      };

      overlays = with inputs; [
        snowfall-flake.overlays.default
      ];

      # add modules to systems and home-managers
      # https://snowfall.org/reference/lib/#external-overlays-and-modules

      # add nixvim to all home-manager modules
      homes.modules = with inputs; [
        nixvim.homeManagerModules.nixvim
        sops-nix.homeManagerModules.sops
      ];

      # add hm and sops-nix to darwin systems
      systems.modules.darwin = with inputs; [
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
          };
        }
      ];

      # add hm and sops-nix to nixos systems
      systems.modules.nixos = with inputs; [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
          };
        }
      ];
    };
}
