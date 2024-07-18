{ config, pkgs, inputs, ... }:

{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    # Don't let home manager manage the AGS config directory
    configDir = null;
    extraPackages = with pkgs; [ gtksourceview webkitgtk accountsservice ];
  };
}
