{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    nixGrammars = false;

    settings = {
      highlight = {
        enable = true;
        disable = [ "markdown" ];
      };
      indent.enable = true;
      ensure_installed = [
        "c"
        "lua"
        "typescript"
        "jsdoc"
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
    };
  };

  programs.nixvim.plugins.treesitter-context.enable = true;
}
