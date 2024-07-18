{ config, pkgs, inputs, lib, theme, ... }:

let kvOps = { listsAsDuplicateKeys = true; };
in {
  home.file."${config.xdg.configHome}/ghostty/config" = {
    text = lib.generators.toKeyValue kvOps {
      background = theme.colors.withHashtag.base00;
      background-opacity = 1;
      foreground = "#ffffff";
      window-decoration = false;
      clipboard-paste-protection = false;
      confirm-close-surface = false;
      window-padding-x = 0;
      window-padding-y = 0;
      # font-family = "MesloLGSDZ Nerd Font";
      font-family = theme.fonts.code; # "JetBrainsMono Nerd Font Mono";
      font-size = 10;
      font-variation = [ "wght=700" ];
      font-feature = [ "-calt" "-liga" ];
      font-thicken = true;
      cursor-style = "bar";
      cursor-style-blink = true;
      # TODO: Is there a more idiomatic way of doing this?
      palette = [
        # black
        "0=${theme.colors.withHashtag.base01}"
        "8=${theme.colors.withHashtag.base01}"
        # red
        "1=${theme.colors.withHashtag.base0A}"
        "9=${theme.colors.withHashtag.base0A}"
        # green
        "2=${theme.colors.withHashtag.base0D}"
        "10=${theme.colors.withHashtag.base0D}"
        # yellow (our theme doesn't have a yellow for some reason?)
        "3=#ffe87b"
        "11=#ffe87b"
        # blue
        "4=${theme.colors.withHashtag.base09}"
        "12=${theme.colors.withHashtag.base09}"
        # purple
        "5=${theme.colors.withHashtag.base0C}"
        "13=${theme.colors.withHashtag.base0C}"
        # aqua
        "6=${theme.colors.withHashtag.base08}"
        "14=${theme.colors.withHashtag.base08}"
        # white
        "7=${theme.colors.withHashtag.base04}"
        "15=${theme.colors.withHashtag.base04}"
      ];
      selection-background = theme.colors.withHashtag.base0A;
    };
  };
}
