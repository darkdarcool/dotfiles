{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.neocord = {
    enable = true;
    settings = {
      logo = "auto";
      logo_tooltip = "nvim and nixvim sucks btw";
      editing_text = "Editing %s";
      workspace_text = "Working on %s";
      # autoUpdate = true;
      debounce_timeout = 10;
      main_image = "language";
      global_timer = true;
    };
  };
}
