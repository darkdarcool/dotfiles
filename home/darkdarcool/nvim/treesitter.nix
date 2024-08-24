{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    # vim, regex, lua, bash, markdown, and markdown_inline are required by noice.nvim
    ensureInstalled = [
      "c"
      "lua"
      "typescript"
      "rust"
      "javascript"
      "markdown"
      "markdown_inline"
      "swift"
      "nix"
      "vim"
      "regex"
      "bash"
      "zig"
    ];
    # ensureInstalled = "all";
    disabledLanguages = [ "markdown" ];
    indent = true;
    nixGrammars = false;
  };

  programs.nixvim.plugins.treesitter-context.enable = true;
}
