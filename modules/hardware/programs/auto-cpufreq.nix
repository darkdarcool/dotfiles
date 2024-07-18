{ inputs, lib, config, ... }:

# We aren't firing the after-burners here
let
  powerSettings = let 
    MHz = x: x * 1000;
  in {
    governor = "powersave";
    turbo = "never";

    scaling_min_freq = lib.modules.mkDefault (MHz 1200);
    scaling_max_freq = lib.modules.mkDefault (MHz 1800);
  };
in
{
  options.modules.hardware.auto-cpufreq = {
    enable = lib.mkEnableOption "auto-cpufreq";
  };

  # TODO: Make this configurable
  config = lib.mkIf config.modules.hardware.auto-cpufreq.enable {
    programs.auto-cpufreq = {
      enable = true;
      settings = {
        charger = powerSettings;
        battery = powerSettings;
      };
    };
  };
}
