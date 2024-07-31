{ config, pkgs, inputs, ... }:

{
  hardware.opengl.enable = true;
  users.users.darkdarcool = {
    isNormalUser = true;
    description = "darkdarcool";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.nushell;

    packages = with pkgs; [
      cairo
      kitty
      hyper
      pamixer
      #auto-cpufreq
      fd
      brightnessctl
      dart-sass
      hyprpicker
      jq
      websocat
      eww
      bun
      swww
      deno
      arp-scan
      easyeffects
      ventoy
      sbctl
      xdg-desktop-portal-hyprland
      #pipewire
      nixfmt
      #wireplumber
      #iniparser
      obs-studio
      #wayfarer
      cava
      #kooha
      libGLU
      inetutils
      brave
      #libdbusmenu-gtk3
      #ags
      nurl
      #jetbrains-toolbox
      #erlang_odbc
      #gleam
      glow
      fastfetch
      #thunderbird
      fontconfig
      direnv
      nh
      #termcap
      ncurses5
      #inputs.unstable.legacyPackages."${pkgs.system}".go
      #inputs.unstable.legacyPackages."${pkgs.system}".rust-analyzer
      #inputs.zls.packages."${pkgs.system}".zls
      # zls-fixed
      #inputs.zig.packages."${pkgs.system}".master
      phinger-cursors
      cpio
      meson
      #cmake
      zed-editor
      gimp
      #vencord
      vesktop
      #swww
      nil
      firefox
      #kitty
      wl-clipboard
      copyq
      #yazi
      # bun 
      #inputs.unstable.legacyPackages."${pkgs.system}".bun
      #inputs.unstable.legacyPackages."${pkgs.system}".deno
      inputs.unstable.legacyPackages."${pkgs.system}".hyprlock
      inputs.unstable.legacyPackages."${pkgs.system}".hyprcursor
      #inputs.unstable.legacyPackages."${pkgs.system}".vimPlugins.base16-nvim
      # inputs.unstable.legacyPackages."${pkgs.system}".neovim
      #rose-pine-gtk-theme
      #rose-pine-icon-theme
      #firefoxpwa
      #carapace
      #lunar-client
      #rustup
      nushell
      neofetch
      shotman
      grim
      slurp
      vscode
      gh
      #cloudflared
      #greetd.tuigreet
      #wofi
      bat
      eza
      alacritty
      starship
      spotify
      unzip
      # zls
      zoxide
      fzf
      pkg-config
      playerctl
      wttrbar
      #wlsunset
      #swaynotificationcenter
      mako
      #cli-visualizer
      cbonsai
      #steamPackages.steamcmd
      #steam-tui
      xfce.thunar
      xfce.ristretto
      openssl
      libiconv
    ];
  };

}
