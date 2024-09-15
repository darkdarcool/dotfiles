# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/plugins.nix
    ./modules/programs.nix
    ./modules/system.nix
    ./modules/env.nix
  ];

  # Sudo
  #security.sudo.extraRules = [{
  #  users = [ "darkdarcool" ];
  #  commands = [{
  #    command = "ALL";
  #    options = [
  #      "NOPASSWD"
  #      "SETENV"
  #    ]; # "SETENV" # Adding the following could be a good idea
  #  }];
  #}];

  # If you hate yourself
  #nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable CUPS to print documents.
  services.printing.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "unstable"; # "23.11"; # Did you read the comment?

  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [ "FiraCode" "Meslo" "JetBrainsMono" "Lilex" ];
    })
    sf-mono-liga-bin
    noto-fonts
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
  ];

  hardware.bluetooth.settings = {
    General = { Enable = "Source,Sink,Media,Socket"; };
  };

  hardware.sensor.iio.enable = true;

  #nixpkgs.config.packageOverrides = pkgs: {
  #  nur = import
  #    (builtins.fetchTarball
  #      "https://github.com/nix-community/NUR/archive/master.tar.gz")
  #    {
  #      inherit pkgs;
  #    };
  #};
  /* programs.auto-cpufreq.enable = true;
     # optionally, you can configure your auto-cpufreq settings, if you have any
     programs.auto-cpufreq.settings = {
     charger = {
       # governor = "performance";
       governor = "powersave";
       turbo = "never";
     };

     battery = {
       governor = "powersave";
       # governor = "powersave";
       turbo = "never";
     };
     };
  */

  #nix.settings = {
  #  substituters =
  #    [ "https://hyprland.cachix.org" "https://ghostty.cachix.org" ];
  #  trusted-public-keys = [
  #    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
  #    "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
  #  ];
  #};

  #nix.settings.sandbox = false;
  #users.defaultUserShell = pkgs.nushell;

  #programs.nh = {
  #  enable = true;
  #  clean.enable = true;
  #  clean.extraArgs = "--keep-since 5d --keep 3";
  #};
}
