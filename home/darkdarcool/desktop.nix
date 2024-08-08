{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    font.name = "Liga SFMono Nerd Font";

    #theme = {
    #  name = "Catppuccin-Mocha-Standard-Maroon-Dark";
    #  package = pkgs.catppuccin-gtk.override {
    #	accents = [ "maroon" ];
    #	size = "standard";
    #	tweaks = [ "rimless" "black" ];
    #	variant = "mocha";
    #  }; 
    #};
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.morewaita-icon-theme; # pkgs.whitesur-icon-theme;
    };

    theme = {
      name = "phocus";
      package = pkgs.phocus-oxocarbon;
    };

    cursorTheme = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    #package = pkgs.bibata-cursors;
    #name = "Bibata-Modern-Classic";
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 32;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "phinger-cursors-dark";
    XCURSOR_SIZE = "32";
  };
}
