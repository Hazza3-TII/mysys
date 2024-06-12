{ config, pkgs, home-manager, ... }:

{
  home-manager.users."hazaa".xdg.configFile = {
    "nvim/init.lua".source = ./nvim/init.lua;
    "nvim/lua/options.lua".source = ./nvim/lua/options.lua;
    };
  home-manager.users."hazaa".xdg.configFile."nvim/lua/packages.lua".source = ./nvim/lua/packages.lua;
}
