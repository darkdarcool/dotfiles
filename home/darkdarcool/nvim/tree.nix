{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.nvim-tree = {
    enable = true;

    filters = {
      custom =
        [ "node_modules" "target" "result" ".git/" "zig-cache" "zig-out" ];
      dotfiles = true;
    };

    actions = { openFile = { quitOnOpen = true; }; };

    view = {
      float = {
        enable = true;
        openWinConfig = {
          col = 1;
          row = 1;
          relative = "cursor";
          border = "rounded";
          style = "minimal";
        };
      };
    };

    # autoClose = true;
    openOnSetup = true;
  };
}
