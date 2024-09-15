{ config, pkgs, inputs, ... }:

{
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.XCURSOR_SIZE = "28";
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${pkgs.system}".default
    # waybar
    #inputs.waybar.packages."${pkgs.system}".default
    inputs.ghostty.packages."${pkgs.system}".default
    rofi-wayland
    wtype
    #hyprpaper
    discord
    git
    cloudflare-warp
    adwaita-icon-theme
    networkmanagerapplet
    libgcc
    # zig_0_12
    tree-sitter
    nodejs_22
    obsidian
    python311
    ripgrep
    # gccgo13
    go
    brightnessctl
    openssl
    pavucontrol
    bluez
    #inkscape-with-extensions
    #(pkgs.catppuccin-gtk.override {
    #  accents = [ "maroon" ];
    #  size = "standard";
    #  tweaks = [ "rimless" "black" ];
    #  variant = "mocha";
    #})
  ];
  environment.etc = {
    "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text =
      "	bluez_monitor.properties = {\n		[\"bluez5.enable-sbc-xq\"] = true,\n		[\"bluez5.enable-msbc\"] = true,\n		[\"bluez5.enable-hw-volume\"] = true,\n		[\"bluez5.headset-roles\"] = \"[ hsp_hs hsp_ag hfp_hf hfp_ag ]\"\n	}\n";
  };

  environment.variables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    SSH_AUTH_SOCK = "~/.1password/agent.sock";
  };
}
