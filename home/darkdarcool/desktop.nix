{ config, pkgs, inputs, ... }:

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

    gtk4.extraCss = ''
            @define-color surface-strongest rgb(10, 10, 10);
      @define-color surface-strong rgb(20, 20, 20);
      @define-color surface-moderate rgb(28, 28, 28);
      @define-color surface-weak rgb(34, 34, 34);
      @define-color surface-weakest rgb(40, 40, 40);

      @define-color white-strongest rgb(255, 255, 255);
      @define-color white-strong rgba(255, 255, 255, 0.87);
      @define-color white-moderate rgba(255, 255, 255, 0.34);
      @define-color white-weak rgba(255, 255, 255, 0.14);
      @define-color white-weakest rgba(255, 255, 255, 0.06);

      @define-color black-strongest rgb(0, 0, 0);
      @define-color black-strong rgba(0, 0, 0, 0.87);
      @define-color black-moderate rgba(0, 0, 0, 0.42);
      @define-color black-weak rgba(0, 0, 0, 0.15);
      @define-color black-weakest rgba(0, 0, 0, 0.06);

      @define-color red-tint rgba(218, 88, 88, 0.6);
      @define-color red-normal rgb(218, 88, 88);
      @define-color red-light rgb(227, 109, 109);
      @define-color orange-tint rgba(237, 148, 84, 0.6);
      @define-color orange-normal rgb(237, 148, 84);
      @define-color orange-light rgb(252, 166, 105);
      @define-color yellow-normal rgb(232, 202, 94);
      @define-color yellow-light rgb(250, 221, 117);
      @define-color green-tint rgba(63, 198, 97, 0.6);
      @define-color green-normal rgb(63, 198, 97);
      @define-color green-light rgb(97, 214, 126);
      @define-color cyan-normal rgb(92, 216, 230);
      @define-color cyan-light rgb(126, 234, 246);
      @define-color blue-normal rgb(73, 126, 233);
      @define-color blue-light rgb(93, 141, 238);
      @define-color purple-normal rgb(113, 84, 242);
      @define-color purple-light rgb(128, 102, 245);
      @define-color pink-normal rgb(213, 108, 195);
      @define-color pink-light rgb(223, 129, 207);

      @define-color accent_color @purple-light;
      @define-color accent_bg_color @purple-normal;
      @define-color accent_fg_color @white-strong;

      @define-color destructive_color @red-light;
      @define-color destructive_bg_color @red-tint;
      @define-color destructive_fg_color @white-strong;

      @define-color success_color @green-light;
      @define-color success_bg_color @green-tint;
      @define-color success_fg_color @white-strong;

      @define-color warning_color @orange-light;
      @define-color warning_bg_color @orange-tint;
      @define-color warning_fg_color @white-strong;

      @define-color error_color @red-light;
      @define-color error_bg_color @red-tint;
      @define-color error_fg_color @white-strong;

      @define-color window_bg_color @surface-strong;
      @define-color window_fg_color @white-strong;

      @define-color view_bg_color @surface-strong;
      @define-color view_fg_color @white-strong;

      @define-color headerbar_bg_color @surface-strongest;
      @define-color headerbar_fg_color @white-strong;
      @define-color headerbar_border_color @surface-moderate;
      @define-color headerbar_backdrop_color @surface-strongest;
      @define-color headerbar_shade_color transparent;

      @define-color card_bg_color @white-weakest;
      @define-color card_fg_color @white-strong;
      @define-color card_shade_color @white-weak;

      @define-color dialog_bg_color @surface-weak;
      @define-color dialog_fg_color @white-strong;

      @define-color popover_bg_color @surface-weakest;
      @define-color popover_fg_color @white-strong;

      @define-color shade_color @black-strongest;
      @define-color scrollbar_outline_color @white-weakest;

      @define-color borders transparent;

      @define-color sidebar_bg_color @surface-strongest;
      @define-color sidebar_fg_color @white-strong;
      @define-color sidebar_backdrop_color @surface-strongest;
      @define-color sidebar_shade_color @surface-strongest;


      /*
      window contents {
          background: @surface-strongest;
          box-shadow: none;
      }
      */

      popover contents, popover arrow {
      	background: @surface-weakest;
      }

      .solid-csd {
      	padding: 0;
      }

      headerbar {
          padding: 0.3em;
          padding-top: calc(0.3em + 3px);
      }
    '';

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

  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        # An array of all the plugins you want, which either can be paths to the .so files, or their packages
        # inputs.anyrun.packages.${pkgs.system}.applications
        applications
        shell
        websearch
        # ./some_plugin.so
        # "${inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins}/lib/kidex"
      ];
      # x = { fraction = 0.5; };
      y = { fraction = 2.0e-2; }; # absolute = 15; };
      width = { fraction = 0.3; };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = true;
      showResultsImmediately = true;
      maxEntries = 10;

    };

    extraCss = builtins.readFile ./anyrunstyle.css;

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
            max_entries: 10,
            terminal: Some("foot"),
            desktop_actions: false
        )
      '';

      "websearch.ron".text = ''
        Config(
            prefix: "?",
            engines: [Google]
        )
      '';

    };
  };
}
