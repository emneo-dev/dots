{ pkgs, ... }:
{
  home.packages = with pkgs; [
    onefetch
    ncdu
    tldr
    tokei
    rclone
    file
    zip
    unzip
    ffmpeg
    tree
    vim
    curl
    man-pages
    man-pages-posix
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    btop.enable = true;
    htop.enable = true;
    ripgrep.enable = true;
  };
}
