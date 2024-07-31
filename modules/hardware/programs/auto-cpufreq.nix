{ inputs, lib, config, ... }:

# We aren't firing the after-burners here
let
  batteryPowerSettings = let MHz = x: x * 1000;
  in {
    governor = "powersave";
    turbo = "never";

    scaling_min_freq = lib.modules.mkDefault (MHz 1200);
    scaling_max_freq = lib.modules.mkDefault (MHz 1800);
  };
  chargerPowerSettings = let MHz = x: x * 1000;
  in {
    governor = "performance";
    turbo = "auto";

    scaling_min_freq = lib.modules.mkDefault (MHz 1800);
    scaling_max_freq = lib.modules.mkDefault (MHz 3800);
  };
in {
  options.modules.hardware.auto-cpufreq = {
    enable = lib.mkEnableOption "auto-cpufreq";
  };

  # TODO: Make this configurable
  config = lib.mkIf config.modules.hardware.auto-cpufreq.enable {
    services.power-profiles-daemon.enable = false;
    #services.auto-cpufreq.enable = true;
    programs.auto-cpufreq = {
      enable = true;
      settings = {
        charger = chargerPowerSettings;
        battery = batteryPowerSettings;
      };
    };
  };
}
