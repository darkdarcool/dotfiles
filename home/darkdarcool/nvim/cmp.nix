{ config, lib, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.lspkind = {
    enable = true;

    cmp = {
      enable = true;
      after = ''
        function(entry, vim_after, kind)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"
          return kind
        end
      '';
    };

    extraOptions = {
      symbol_map = {
        Text = "󰉿";
        Method = "󰆧";
        Function = "󰊕";
        Constructor = "";
        Field = "󰜢";
        Variable = "󰀫";
        Class = "󰠱";
        Interface = "";
        Module = "";
        Property = "󰜢";
        Unit = "󰑭";
        Value = "󰎠";
        Enum = "";
        Keyword = "󰌋";
        Snippet = "";
        Color = "󰏘";
        File = "󰈙";
        Reference = "󰈇";
        Folder = "󰉋";
        EnumMember = "";
        Constant = "󰏿";
        Struct = "󰙅";
        Event = "";
        Operator = "󰆕";
        TypeParameter = "";
        Copilot = "";
        Supermaven = "";
      };

    };
  };

  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = true;

    settings = {
      mapping = {
        "<Tab>" = "cmp.mapping.confirm({ select = false })";
        "<CR>" = # lua
          ''
            function(fallback)
              if cmp.visible() then	
                cmp.select_next_item()
              else 
                fallback()
              end
            end
          '';
      };

      sources = [
        #{ name = "copilot"; }
        { name = "supermaven"; }
        { name = "nvim_lsp"; }
        { name = "otter"; }
        { name = "nvim_lua"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "luasnip"; }
      ];

      completion = { completeopt = "menu,menuone,noinsert"; };
      window = {
        documentation = { border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ]; };
        completion = {
          side_padding = 0;
          border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
          winhighlight = "Normal:Normal,FloatBorder:BorderBG,Search:None";
          # "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None";
        };
      };
      formatting = { fields = [ "kind" "abbr" "menu" ]; };

      snippet.expand = "luasnip";
    };

    # Completions on the nvim cmdline 
    cmdline = {
      ":" = {
        mapping = { __raw = "cmp.mapping.preset.cmdline()"; };

        sources = [ { name = "path"; } { name = "cmdline"; } ];
      };
    };
  };

}
