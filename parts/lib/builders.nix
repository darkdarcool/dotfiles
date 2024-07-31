{ lib, inputs, ... }:

let
  inherit (inputs) self;
  mkSystem = lib.nixosSystem;

  mkNixSystem = { host, modules, system, withSystem, ... }@args:
    withSystem system ({ inputs', self', ... }:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};

        mkSystem' = mkSystem;

        target = "nixos";
      in lib.mkMerge [{
        "${target}Configurations".${args.host} =
          inputs.nixpkgs.lib.nixosSystem {
            # inherit (args) system;
            system = args.system;
            modules = [
              #inputs.home-manager."${target}Modules".home-manager
              "${self}/hosts/${args.host}"
              {
                config = {
                  #modules.system.hostname = args.host;
                  nixpkgs.hostPlatform = lib.mkDefault args.system;
                  #nixpkgs.allowUnfree = true;
                  nix.settings = {
                    substituters = [
                      "https://hyprland.cachix.org"
                      "https://ghostty.cachix.org"
                    ];
                    trusted-public-keys = [
                      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
                      "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
                    ];
                  };

                  nix.settings.sandbox = false;
                };
              }
            ] ++ args.modules or [ ];
            specialArgs = {
              inherit lib inputs self inputs' self';
            } // args.specialArgs or { };
          };
      }]);
  mkSystems = shits: lib.mkMerge (map mkNixSystem shits);
in { inherit mkSystems; }
