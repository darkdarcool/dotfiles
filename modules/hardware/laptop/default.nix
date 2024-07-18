{ inputs, config, ... }:

{
  imports = [
    # ../default.nix 
    ../programs/auto-cpufreq.nix
  ];
}
