# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, home-manager, ... }:

{
  imports =
    [ 
      # Include the results of the hardware scan.
      ../hardware/x1-hardware.nix
      ../modules/develop.nix
      ../modules/laptop.nix
      ../modules/gnome.nix
      ../modules/apps.nix
      ../modules/shell.nix
      ../modules/neovim.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Dubai";

  # You added this to modify nix.conf
  nix.extraOptions = ''experimental-features = nix-command flakes'';

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" ];
  i18n.extraLocaleSettings = {
    LANG = "en_US.UTF-8/UTF-8";
    LC_MESSAGES = "en_US.UTF-8/UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8/UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8/UTF-8";
    LC_NUMERIC = "en_US.UTF-8/UTF-8";
    LC_TIME = "en_US.UTF-8/UTF-8";
    LC_COLLATE = "en_US.UTF-8/UTF-8";
    LC_NAME = "en_US.UTF-8/UTF-8";
    LC_MONETARY = "en_US.UTF-8/UTF-8";
    LC_PAPER = "en_US.UTF-8/UTF-8";
    LC_ADDRESS = "en_US.UTF-8/UTF-8";
    LC_TELEPHONE = "en_US.UTF-8/UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8/UTF-8";
  }; 

 
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hazaa = {
    isNormalUser = true;
    description = "Hazaa.Alameri";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "root" "@wheel" ];

  # This is for tailscale
  services.tailscale.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    vscode
    vim
    tree
    gcc
    python3
    tailscale
    ntfs3g
    starship
    teams-for-linux
    slack
    xsel
    htop
    git
  ];
  
  # This is for the ghaf remote build
  programs = {
    ssh = {
      startAgent = true;
      extraConfig = ''
	      host red-team
	        user red-team
	        hostname 100.127.162.28
        host ghaf-net
          user root
          hostname 192.168.1.199
	        proxyjump red-team
        host ghaf-host
          user root
          hostname 192.168.101.2
          proxyjump ghaf-net         
      '';
    };

    # This will enable starship
    starship.enable = true;

  }; 
 
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  systemd.services.time_read = {
    enable = false;
    description = "Read System Time";
    script = ''/home/hazaa/Desktop/Scripts/ReadTime/time_read.sh'';
    #wantedBy = [ "multi-user.target" ];
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
