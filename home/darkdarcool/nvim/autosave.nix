{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.auto-save = {
    enable = false;
    triggerEvents = [ "InsertLeave" "TextChanged" ];
    extraOptions = { execution_message = { enabled = false; }; };
  };
}
