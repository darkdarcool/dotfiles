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
      action = /* lua */ ''
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end
      '';
    }
    # TODO: Add Ctrl + F for search
    # vim.keymap.set('n', '<C-f>', '<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("Search for: ") })<CR>')
  ];
}
