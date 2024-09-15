{ config, pkgs, inputs, lib, ... }:

{

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";	
        command = "Hyprland";
        user = "darkdarcool";
      };
    };
    # To prevent it from being overwritten by systemd	
    # unitConfig = {
    #	After = lib.mkOverride 0 [ "multi-user.target" ];
    #};
    #serviceConfig = {
    #	Type = "idle";
    #};

  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    #plugins = [
    #  {
    #    plugin = inputs.minimal-tmux.packages.${pkgs.system}.default;
    #  }
    #];
    extraConfig = "";
  };

  xdg.portal.enable = true;

  programs.hyprland.enable = true;
  programs.light.enable = true;
  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
  };
  services.blueman.enable = true;
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "darkdarcool" ];
  };
  services.automatic-timezoned.enable = true;
  programs.fish.enable = true;

  #programs.bash = {
  #	interactiveShellInit = ''
  #		if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
  #			then
  #				shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
  #				exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
  #				fi
  #				'';
  #};
}
