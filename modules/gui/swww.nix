{ inputs, lib, config, ... }:

{
  options.modules.gui.swww = {
    enable = lib.mkEnableOption "swww wallpaper daemon";  
    path = lib.mkOption {
      description = "path to the wallpaper";
      type = lib.types.str;
    };
  };

  config = lib.mkIf config.modules.gui.swww.enable {
    modules.system.startup = [ "sleep 5 && swww img ${config.modules.gui.swww.path}" ]; 
  };
}
