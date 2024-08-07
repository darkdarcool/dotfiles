{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      denols.enable = true;
      #tsserver.enable = true;
      rust-analyzer = {
        enable = true;
        package = null;
        installRustc = false;
      };
      nil_ls.enable = true;
      zls = {
        enable = true;
        #package = inputs.zls.packages."${pkgs.system}".zls;
        package = null;
      };

      # gleam.enable = true;
    };
    onAttach = ''
        if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          -- vim.lsp.inlay_hint.enable(bufnr, true)
      	  vim.lsp.inlay_hint.enable(true, {})
        end

        require("nvim-navic").attach(client, bufnr)
        require("nvim-navbuddy").attach(client, bufnr)
    '';
  };

  programs.nixvim.plugins.navbuddy = { enable = true; };

  programs.nixvim.plugins.navic.enable = true;
}
