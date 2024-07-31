{ inputs, lib, config, ... }:
let theme = inputs.themes.oxocarbon-dark;
in {
  #options.codefont = lib.mkOption {
  #  type = lib.types.str;
  #  #default = # "JetBrainsMono Nerd Font Mono";
  #  description = "The font to use for code";
  #};

  #config = {
  #codefont = "JetBrainsMono Nerd Font Mono";

  #};

  config = {
    modules = {
      hardware = { auto-cpufreq.enable = true; };
      gui = {
        swww = {
          enable = true;
          path = "/home/darkdarcool/Pictures/wallpapers/oxocarbon.jpg";
        };
      };
    };

  };
  # Is this bad? Yes. Do I care? No.

  imports = [
    ../../configuration.nix

    {
      environment.systemPackages =
        [ inputs.ghostty.packages.x86_64-linux.default ];
    }

    inputs.lanzaboote.nixosModules.lanzaboote
    (../../overlays.nix)
    inputs.auto-cpufreq.nixosModules.default

    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "hm-backup";

      home-manager.extraSpecialArgs = with inputs; {
        inherit nix-colors;
        #inherit nur;
        inherit inputs;
        theme = {
          colors = theme;
          fonts = {
            monospace = "Liga SFMono Nerd Font";
            serif = "MesloLGSDZ Nerd Font";
            code = "JetBrainsMono Nerd Font Mono";
          };
        };
      };

      home-manager.users.darkdarcool = {
        home = { stateVersion = "24.05"; };
        imports = [
          inputs.hyprland.homeManagerModules.default
          # inputs.hyprlock.homeManagerModules.hyprlock
          #inputs.nur.hmModules.nur
          inputs.nixvim.homeManagerModules.nixvim
          inputs.schizofox.homeManagerModule
          # ./hosts/darkdarcool/nvim.nix
          # ./home.nix
          ../../home.nix
        ];
      };
    }
  ];

}
