{ pkgs, zen-browser, ... }:
{
  home.packages = with pkgs; [
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ladybird
    gnome-tweaks
    mediawriter
    flatpak
    freetype
    mullvad-vpn
    libreoffice
    qbittorrent
  ];

  programs = {
    ghostty.enable = true;
    obsidian.enable = true;
    anki.enable = true;
  };
}
