{ config, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.auto-save = {
    enable = false;
    settings = { trigger_events = [ "InsertLeave" "TextChanged" ]; };
    settings = { execution_message = { enabled = false; }; };
  };
}
