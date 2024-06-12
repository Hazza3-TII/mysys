{ config, pkgs, ... }:

{
  home.username = "hazaa";
  home.homeDirectory = "/home/hazaa";

  programs.git = {
    enable = true;
    userName = "Hazaa AlAmeri";
    userEmail = "hazaa.ameri@gmail.com";
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
