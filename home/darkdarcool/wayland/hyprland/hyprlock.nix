{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      #accent = "$muave";
      #accentAlpha = "$muaveAlpha";
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      background = {
        # Blank for all monitors
        monitor = "";
        # Instead of an image being shown as the background, a screenshot is taken and used
        #path = "screenshot";
        color = "rgba(0, 0, 0, 0.1)";
        # Pretty blur :)
        blur_passes = 2;
        blur_size = 7;
      };

      label = [
        # Label for the time
        {
          # Blank for all monitors
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%r")"'';
          color = "0xffbebebe";
          font_size = 90;
          font_family = "Liga SFMono Nerd Font";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }

        # Label for the date
        {
          # Blank for all monitors
          monitor = "";
          text = ''cmd[update:43200000] echo "$(date +"%A, %d %B %Y")"'';
          color = "0xffbebebe";
          font_size = 25;
          font_family = "Liga SFMono Nerd Font";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];

      image = [{
        # Blank for all monitors
        monitor = "";
        # This gets your user's pfp somehow
        path = "/home/darkdarcool/Pictures/pfp.png";
        size = 100;
        border_size = 0;
        position = "0, 75";
        halign = "center";
        valign = "center";
      }];

      input-field = [{
        monitor = "";
        size = "300, 60";
        # outline_thickness = 4;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        inner_color = "0xff262626";
        font_color = "0xffbebebe";
        fade_on_empty = false;
        placeholder_text = ''
          <span foreground="##cdd6f4"><i> Logged in as </i><span foreground="##cba6f7">$USER</span></span>'';
        hide_input = false;
        check_color = "0xffcba6f7";
        fail_color = "0xfff38ba8";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        position = "0, -60";
        halign = "center";
        valign = "center";
      }];
    };
  };
}
