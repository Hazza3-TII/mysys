{ config, pkgs, ... }:

{

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      source-code-pro
      source-sans-pro
      source-serif-pro
      amiri

      #corefonts
      roboto
      ubuntu_font_family
      fira-code 
      fira-code-symbols
      cantarell-fonts
      freefont_ttf
      inconsolata
      liberation_ttf
      lmodern
      ttf_bitstream_vera
      inter

      # Bitmap fonts
      terminus_font
    ];
  };

  # Default applications for graphical systems    
  environment.systemPackages = with pkgs; [
    zathura
    firefox
  ];

}
