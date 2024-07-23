{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.nvim-tree = {
    enable = true;

    filters = {
      custom =
        [ "node_modules" "target" "result" ".git/" "zig-cache" "zig-out" ];
      dotfiles = true;
    };

    #extraOptions = {
      #ignore_focus = [ "NvimTree" ];
    #};

    diagnostics = {
      enable = true;
      icons = {
        hint = "";
        info = "";
        warning = "";
        error = "";
      };
    };

    actions = { openFile = { quitOnOpen = true; }; };

    view = {
      float = {
        enable = true;
        #openWinConfig = {
        #  col = 1;
        #  row = 1;
        #  relative = "cursor";
        #  border = "rounded";
        #  style = "minimal";
        #};
        openWinConfig = {
          __raw = /* lua */ ''
            function()
              local WIDTH_RATIO = 0.5
              local HEIGHT_RATIO = 0.8

              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = screen_w * WIDTH_RATIO
              local window_h = screen_h * HEIGHT_RATIO
              local window_w_int = math.floor(window_w)
              local window_h_int = math.floor(window_h)
              local center_x = (screen_w - window_w) / 2
              local center_y = ((vim.opt.lines:get() - window_h) / 2)
                - vim.opt.cmdheight:get()
              return {
                border = "rounded",
                relative = "editor",
                row = center_y,
                col = center_x,
                width = window_w_int,
                height = window_h_int,
              }
            end,
          '';
        };
      };

      width = 98; #{ # 98
        #__raw = /* lua */ ''
        #  function()
        #    return math.floor(vim.opt.columns:get() * 0.5)
        #  end,
        #'';
      #};
      
      #relativenumber = true;
    };

    # autoClose = true;
    openOnSetup = true;
  };
}
