{ config, pkgs, inputs, theme, ... }:

{
  imports = [
    #./hosts/darkdarcool/nvim.nix
    #./hosts/darkdarcool/desktop.nix
    #./hosts/darkdarcool/schizofox.nix
    #./hosts/darkdarcool/wayland
    #./hosts/darkdarcool/terminals
    #./home/darkdarcool/nvim.nix
    #./home/darkdarcool/desktop.nix
    #./home/darkdarcool/schizofox.nix
    #./home/darkdarcool/wayland
    #./home/darkdarcool/terminals
    #  ./hosts/darkdarcool/firefox.nix
    ./home/darkdarcool/default.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "darkdarcool";
  home.homeDirectory = "/home/darkdarcool";

  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.packages = [ ];

  home.file = { };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
    # backupFileExtension = "backup";
  };

  programs.bat = {
    config.theme = "base16";
    themes.base16.src = pkgs.writeText "base16.oxocarbon" theme.colors;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "default-web-browser" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];
    };
  };
}
