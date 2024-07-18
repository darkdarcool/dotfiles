{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.lspsaga = { enable = false; };
}
