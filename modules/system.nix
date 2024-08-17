{ config, inputs, pkgs, lib, ... }:

{

  services.upower.enable = true;
  security.pam.services.hyprlock = { };
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Audio
  # sound.enable = true;
  # hardware.pulseaudio.enable = false;
  # security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    wireplumber = {
      enable = true;
      extraConfig = {
        "10-disable-camera" = {
          "wireplumber.profiles" = {
            main."monitor.libcamera" = "disabled";
          };
        };
      };
    };
    pulse.enable = true;
    jack.enable = true;
  };

  #sound.enable = true;
  hardware.pulseaudio = {
    enable = false;
    package = pkgs.pulseaudioFull;
    extraConfig = ''
      load-module module-switch-on-connect
    '';
  };

  hardware.bluetooth = { enable = true; };

  # Workaround until this hits unstable:
  # https://github.com/NixOS/nixpkgs/issues/113628
  systemd.services.bluetooth.serviceConfig.ExecStart = [
    ""
    "${pkgs.bluez}/libexec/bluetooth/bluetoothd -f /etc/bluetooth/main.conf"
  ];
  # systemd.darkdarcool.sessionVariables.SSH_AUTH_SOCK = "~/.1password/agent.sock"; 
  #services.howdy = {
  #     enable = true;
  #     package = inputs.howdy.legacyPackages.${pkgs.system}.howdy;
  #     settings = {
  #       core = {
  #         no_confirmation = true;
  #         abort_if_ssh = true;
  #       };
  #       video.dark_threshold = 90;
  #     };
  #   };
  # 
  #   services.linux-enable-ir-emitter = {
  #     enable = true;
  #     package = inputs.howdy.legacyPackages.${pkgs.system}.linux-enable-ir-emitter;
  #   };
  boot.loader.systemd-boot.enable = true;

  # boot.lanzaboote = {
  #   enable = true;
  #   pkiBundle = "/etc/secureboot";
  # };
}
