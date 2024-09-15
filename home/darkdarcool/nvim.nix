{ config, pkgs, lib, ... }:

{
  imports = [
    ./nvim/lsp.nix
    ./nvim/cmp.nix
    ./nvim/tree.nix
    ./nvim/presence.nix
    ./nvim/treesitter.nix
    ./nvim/keymaps.nix
    ./nvim/lualine.nix
    ./nvim/noice.nix
    ./nvim/lspsaga.nix
    ./nvim/autosave.nix
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.cyberdream = {
      enable = true;
      settings = {
        transparent = true;
        italic_comments = true;
        cache = true;
      };
    };

    colorschemes.nightfox = {
      enable = false;
      flavor = "carbonfox";

      settings = { options = { transparent = true; }; };
    };

    opts = {
      number = true;
      shiftwidth = 2;
    };

    # Map leader to SPACE
    globals.mapleader = " ";

    extraConfigLua = builtins.readFile ./nvim/init.lua;

    plugins = {
      copilot-lua.enable = true;
      copilot-chat.enable = true;
      copilot-cmp.enable = false;
      cmp-cmdline.enable = true;
      lsp-format.enable = true;
      luasnip.enable = true;
    };

    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        plugins = true;
      };

      combinePlugins = { enable = false; };
    };

    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "smartcolumn";
        src = pkgs.fetchFromGitHub {
          owner = "m4xshen";
          repo = "smartcolumn.nvim";
          rev = "cefb17be095ad5526030a21bb2a80553cae09127";
          hash = "sha256-DHIeDNUF9n9s14GVeojIwc5QUPwJMYYl3gRvhvO/rdE=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "copilot-status";
        src = pkgs.fetchFromGitHub {
          owner = "ofseed";
          repo = "copilot-status.nvim";
          rev = "ea9e7000e82a89aac9d8434675dfed3da4ec1158";
          hash = "sha256-DR9H8ZDmEidXCyCIzuQTQFpvnPiV0xfUfQC6XOc2RkM=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "mini.animate";
        src = pkgs.fetchFromGitHub {
          owner = "echasnovski";
          repo = "mini.animate";
          rev = "320fb35460238c436407cd779f63abad98e84870";
          hash = "sha256-Pql/g9ouKvHnsmzldcx+zIPvxyJrMdYz4aXSkoGlSs8=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "supermaven-nvim";
        src = pkgs.fetchFromGitHub {
          owner = "supermaven-inc";
          repo = "supermaven-nvim";
          rev = "d71257f431e190d9236d7f30da4c2d659389e91f";
          hash = "sha256-v5OIPQJhNdZA3Prw6DGq8fRxsmKvouGbt0IKhAZdlQM=";
        };
      })
    ];
  };
}
