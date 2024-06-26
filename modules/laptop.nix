{ config, pkgs, ... }:

{

  # Assumption: all laptops use SSDs
  services.fstrim.enable = true;

  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 80;
      STOP_CHARGE_THRESH_BAT0 = 85;
      USB_AUTOSUSPEND = 0; # Mouse disconnecting issue
      USB_AUTOSUSPEND_ON_AC = 0;
      USB_AUTOSUSPEND_ON_BAT = 0;
    };
  };

  boot.kernelParams = [
    "workqueue.power_efficient=y"
    # Disable vendor OEM logo (BGRT)
    "video=efifb:nobgrt"
    "bgrt_disable"
  ];

  powerManagement = {
    enable = true;
  };

  networking.networkmanager = {
    enable = true;
    wifi.powersave = true;
  };

  services.libinput = {
    enable = true;
    touchpad = {
      disableWhileTyping = true;
      tapping = true;
      naturalScrolling = true;
    };
  };

  services.logind.lidSwitch = "suspend";
  hardware.bluetooth = {
    enable = true; #not using bluetooth currently
  };

  location.latitude = 25.1959313;
  location.longitude = 55.2737957;
  services.redshift = {
    enable = true;
  };

  # creating this empty file enables redshift for this user
  home-manager.users."hazaa".xdg.configFile."systemd/user/default.target.wants/redshift.service".text = "";

  # Also assuming all laptops are ThinkPads for now...
  # Fix Thinkpad specific issue of throttling
  services.throttled.enable = true;

}
