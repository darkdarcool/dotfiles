{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.noice = {
    enable = true;
    lsp = {
      hover = {
        enabled = true;
        opts = { border = { style = "rounded"; }; };
      };
      signature = { enabled = false; };
      override = {
        "vim.lsp.util.convert_input_to_markdown_lines" = true;
        "vim.lsp.util.stylize_markdown" = true;
        "cmp.entry.get_documentation" = true;
      };
    };
    views = {
      mini = { win_options = { winblend = 0; }; };

      hover = { border = { style = "rounded"; }; };
    };
  };
}
