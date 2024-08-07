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

    options = {
      number = true;
      shiftwidth = 2;
    };

    # Map leader to SPACE
    globals.mapleader = " ";

    extraConfigLua = builtins.readFile ./nvim/init.lua;

    plugins = {
      copilot-vim.enable = true;
      copilot-chat.enable = true;
      copilot-cmp.enable = false;
      cmp-cmdline.enable = true;
      lsp-format.enable = true;
      luasnip.enable = true;
    };

    extraPlugins = let
      kui-nvim-plugin = pkgs.vimUtils.buildVimPlugin {
        name = "kui-nvim-plugin";
        src = pkgs.fetchFromGitHub {
          owner = "romgrk";
          repo = "kui.nvim";
          rev = "b3b2f53d6678dce86acc91043b32eab6059ce0cf";
          hash = "sha256-HH2I/0/lspPU+LiMH/g7w3B4IBXZ8Tj0/UkwqhSE4uw=";
        };

        buildInputs = [ pkgs.cairo ];
        extraPackages = [ pkgs.cairo ];
      };
    in [
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
        name = "fzy-lua-native";
        src = pkgs.fetchFromGitHub {
          owner = "romgrk";
          repo = "fzy-lua-native";
          rev = "820f745b7c442176bcc243e8f38ef4b985febfaf";
          hash = "sha256-Ja4xNGruETSU1nq+r+hkJiFpnMbmL9m2JIKC6gHFGf4=";
        };

        buildPhase = ''
          make
        '';
      })

      (pkgs.vimUtils.buildVimPlugin {
        name = "serenity";
        src = pkgs.fetchFromGitHub {
          owner = "Wansmer";
          repo = "serenity.nvim";
          rev = "3aebe727ed84907676ac99fcc7a95c929a6cf640";
          hash = "sha256-532Ev20sMzDvdBsoROVOg/0p12mIt1tpf9jkbVU/S3c=";
        };
      })

      /* (pkgs.buildFHSUserEnv {
           name = "kui-nvim";
           targetPkgs = pkgs: with pkgs; [
             cairo
             kui-nvim-plugin
           ];
         })
         ( pkgs.vimUtils.buildVimPlugin {
             name = "kui";
             src = pkgs.fetchFromGitHub {
               owner = "romgrk";
               repo = "kui.nvim";
               rev = "b3b2f53d6678dce86acc91043b32eab6059ce0cf";
               hash = "sha256-HH2I/0/lspPU+LiMH/g7w3B4IBXZ8Tj0/UkwqhSE4uw=";
             };

             buildInputs = [ pkgs.cairo ];
             extraPackages = [ pkgs.cairo ];
           })

         (pkgs.vimUtils.buildVimPlugin {
           name = "kirby";
           src = pkgs.fetchFromGitHub {
             owner = "romgrk";
             repo = "kirby.nvim";
             rev = "31d43bc746fbc01f3bae03b3ff4adb9fa2cb9cdc";
             hash = "sha256-8lfqS0pjpxsr2uR1pvtPcZZjSqHJDoz+uORTxOK0ZAs=";
           };
         })
      */
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
