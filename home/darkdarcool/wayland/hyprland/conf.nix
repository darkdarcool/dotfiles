{ config, pkgs, inputs, osConfig, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    # TODO: Add hyprland unstable
    #package = inputs.hyprland;

    # plugins = [ inputs.hycov.packages.${pkgs.system}.hycov ];

    extraConfig = ''
      #bind = ALT, tab, hycov:toggleoverview
      #bind = ALT, left, hycov:movefocus, l
      #bind = ALT, right, hycov:movefocus, r
      #bind = ALT, up, hycov:movefocus, u
      #bind = ALT, down, hycov:movefocus, d

      #plugin {
      #  hycov {
      #	  overview_gappo = 60 #gaps width from screen
      #		overview_gappi = 24 #gaps width from clients
      #	  hotarea_size = 10 #hotarea size in bottom left,10x10
      #		enable_hotarea = 1 # enable mouse cursor hotarea
      #	}
      #}
    '';

    settings = {
      debug = {
        disable_logs = false;
      };

      "$mainMod" = "SUPER";
      decoration = {
        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          brightness = 1;
          contrast = 1.3;
          noise = 1.17e-2;
          xray = true;

          ignore_opacity = true;
          new_optimizations = true;
          blurls = "notifications";
        };

        drop_shadow = false;
        shadow_range = 30;
        shadow_render_power = 10;
        "col.shadow" = "0xffc97163";
        "col.shadow_inactive" = "0xff9ccfd8cc";
        dim_inactive = true;
        dim_strength = 0.2;
        rounding = 5;
        #screen_shader = "${./dither.frag}";
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        touchpad = {
          scroll_factor = 0.4;
          natural_scroll = true;
        };

        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
        allow_tearing = false;
      };

      animations = {
        enabled = true;
        bezier = [
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
        ];
        animation = [
          "windows, 1, 3, overshot, slide"
          "windowsOut, 1, 3, smoothOut, slide"
          "windowsMove, 1, 3, default"
          "border, 1, 3, default"
          "fade, 1, 3, smoothIn"
          "fadeDim, 1, 3, smoothIn"
          "workspaces, 1, 3, default"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        # new_is_master = true; 
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        vfr = true;
      };

      bind = [
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, V, togglefloating,"
        "$mainMod, J, togglesplit,"
        "$mainMod, L, exec, hyprlock"
        #"$mainMod, W, exec, pkill waybar && hyprctl dispatch exec waybar"
        "$mainMod, T, exec, ags -t launcher"
        "$mainMod SHIFT, N, exec, swaync-client -t -sw"
        #''SUPER_SHIFT, S, exec, grim -g "$(slurp -d)" - | wl-copy''
        "SUPER_SHIFT, S, exec, hyprshot -m region --clipboard-only"
        "SUPER_SHIFT, A, exec, hyprshot -m window --clipboard-only"
        #"ALT, Tab, cyclenext,"
        #"ALT, Tab, bringactivetotop,"
        #"ALT,tab,overview:toggle"
      ] ++ (builtins.concatLists (builtins.genList (x:
        let ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
        in [
          "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
          "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
        ]) 10));

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # bindr = [ "SUPER, SUPER_L, exec, ags -t launcher " ];
      bindr = [ "SUPER, SUPER_L, exec, rofi -show drun" ];

      bindel = let playerctl = "${pkgs.playerctl}/bin/playerctl";
      in [
        #", XF86AudioRaiseVolume, exec, amixer -D pipewire sset Master 5%+"
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        #", XF86AudioLowerVolume, exec, amixer -D pipewire sset Master 5%-"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86AudioPlay, exec, ${playerctl} play-pause"
        ", XF86AudioNext, exec, ${playerctl} next"
      ];

      bindl = [
        #", XF86AudioMute, exec, amixer set Master toggle"
        ", XF86AudioMute, exec, pamixer -t"
        ", switch:Lid Switch, exec, hyprlock"
      ];

      windowrulev2 = [
        "size 1000 800, class:firefox"
        "center, class:firefox"
        "size 800 600, class:kitty"
        "center, class:kitty"
        "float, title:^(Picture in picture)$"
        "pin, title:^(Picture in picture)$"
      ];

      exec-once = [
        "copyq --start-server"
        # "sleep 3 && waybar"
        "sleep 2 && ags"
        # "swaync"
        "sudo warp-svc"
        # "hyprpaper"
        "ssh-agent -s"
        "swww-daemon"
        # "mako"
        #"pipewire"
        #"wireplumber"
        # lock hyprland on open
        "hyprlock"
        "hyprctl setcursor phinger-cursors-dark 24"
      ] ++ osConfig.modules.system.startup;
    };
  };
}
