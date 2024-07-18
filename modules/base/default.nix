{ lib, ... }:

{
  options.modules.system.startup = lib.mkOption {
    description = "List of startup programs";
    type = lib.types.listOf lib.types.str; 
  };
  config = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    modules.system.startup = [];

    programs.ssh = {
      extraConfig = ''
Host *
  IdentityAgent /home/darkdarcool/.1password/agent.sock
  ForwardAgent yes
      '';
    };
  };
  
}
