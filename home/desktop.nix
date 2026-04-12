{ pkgs, zen-browser, ... }:
{
  home.packages = with pkgs; [
    ghostty
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ladybird
    gnome-tweaks
    mediawriter
    flatpak
    freetype
    mullvad-vpn
    obsidian
    anki
    libreoffice
    qbittorrent
  ];
}
