{ config, pkgs, ... }:

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
    # colorschemes.oxocarbon.enable = true;
    colorschemes.cyberdream = {
      enable = true;
      settings = {
        transparent = true;
      };
    };
    # colorschemes.poimandres.enable = true;

    options = {
      number = true;
      shiftwidth = 2;
    };

    # Map leader to SPACE
    globals.mapleader = " ";

    extraConfigLua = ''
          	-- get rid of the sign column (it moves text and thats a no no)
            vim.opt.signcolumn = "no"
            
            -- rounded hover doc (its 10x better)
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
              border = "rounded",
              underline = true
            })

      			-- border color fix for oxocarbon
            -- vim.cmd("hi FloatBorder guifg=#acacac guibg=#161616")

            vim.opt.title = true
            vim.opt.titlelen = 0 -- do not shorten title
            
            vim.api.nvim_create_autocmd("BufEnter", { 
              pattern = "*",
              callback = function()
              	local path = vim.fn.expand("%:p")
                -- replace /home/darkdarcool with ~
                path = string.gsub(path, "/home/darkdarcool", "~")
                vim.opt.titlestring = "nvim " .. path
              end
            })

            -- add colorcolumn
            vim.opt.colorcolumn = "80"
	          require("smartcolumn").setup({
              colorcolumn = "80",
              disabled_filetypes = { "help", "text", "markdown" },
              custom_colorcolumn = {},
              scope = "line",
            })

            -- tab size
            vim.opt.tabstop = 2
            vim.opt.shiftwidth = 2
      			vim.opt.expandtab = true
      			vim.opt.smartindent = true
    '';

    plugins = {
      copilot-vim.enable = true;
      copilot-cmp.enable = false;
      cmp-cmdline.enable = true;
      lsp-format.enable = true;
      luasnip.enable = true;
    };

    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "diagflow";
        src = pkgs.fetchFromGitHub {
          owner = "dgagn";
          repo = "diagflow.nvim";
          rev = "6d2ad945ddbc46f42a0a2e7618975a5f3d2e7dbe";
          hash = "sha256-6TeCbJV74kgm9yslPQp1k4KQv+FB+qHe5UVZN3adjko=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "pretty_hover";
        src = pkgs.fetchFromGitHub {
          owner = "Fildo7525";
          repo = "pretty_hover";
          rev = "4c6e6f2d968e34cd9d2074b1d37b5b58c5362348";
          hash = "sha256-xpL4Lk3HFa6+FCOOC69Bqcxr62EDqu+WdvXd2kzI6Hk=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "inlay-hints";
        src = pkgs.fetchFromGitHub {
          owner = "MysticalDevil";
          repo = "inlay-hints.nvim";
          rev = "0dafb2cc1899bcb29fa5e65788aedcbd213a3591";
          hash = "sha256-5d+j6b6V/VuStlfZWZ2PdYE1QaoMQuArHAuVTyCZjsE=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "lsp_signature";
        src = pkgs.fetchFromGitHub {
          owner = "ray-x";
          repo = "lsp_signature.nvim";
          rev = "5babe266b99a273a866525baaaee34c603997b8b";
          hash = "sha256-lS3WYly9MbZtew4J16OLn/I7KJGNm9iEcrJ7CEU/Hzc=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "smartcolumn";
        src = pkgs.fetchFromGitHub {
          owner = "m4xshen";
          repo = "smartcolumn.nvim";
          rev = "cefb17be095ad5526030a21bb2a80553cae09127";
          hash = "sha256-DHIeDNUF9n9s14GVeojIwc5QUPwJMYYl3gRvhvO/rdE=";
        };
      })

      #(pkgs.vimUtils.buildVimPlugin {
      #	name = "glow-hover";
      #	src = pkgs.fetchFromGitHub {
      #	  owner = "JASONews";
      #	  repo = "glow-hover.nvim";
      #	  rev = "c8d0cae5d05c658f4701425b05f1432121092c68";
      #	  hash = "sha256-pE4fq3tbsTswfFyf1vy8JvIQ7D/lUpoL+66Tmt1wkRE=";
      #	};
      #})
    ];
  };
}
