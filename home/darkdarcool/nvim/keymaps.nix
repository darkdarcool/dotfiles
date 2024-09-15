{ config, pkgs, inputs, ... }:

{
  programs.nixvim.keymaps = [
    {
      action = "<cmd>NvimTreeFocus<CR>";
      key = "<leader>f";
    }
    {
      action = "<cmd>lua vim.lsp.buf.hover()<CR>";
      key = "<leader>d";
    }
    {
      action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      key = "<leader>D";
    }
    {
      key = "<leader>ccq";
      action.__raw = # lua
        ''
          function()
            local input = vim.fn.input("Quick Chat: ")
            if input ~= "" then
              require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
            end
          end
        '';
    }
    {
      key = "<leader>e";
      action.__raw = # lua
        ''
          function() 
            vim.diagnostic.open_float({ border = "rounded" })
          end
        '';
    }
    {
      key = "<C-f>";
      action.__raw = # lua
        ''
          function()
            if not require("noice.lsp").scroll(4) then
              return "<C-f>"
            end
          end
        '';
      options = {
        silent = true;
        expr = true;
      };
    }
    {
      key = "<C-b>";
      action.__raw = # lua
        ''
          function()
            if not require("noice.lsp").scroll(-4) then 
              return "<C-b>"
            end
          end
        '';
      options = {
        silent = true;
        expr = true;
      };
    }
    # TODO: Add Ctrl + F for search
    # vim.keymap.set('n', '<C-f>', '<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("Search for: ") })<CR>')
  ];
}
