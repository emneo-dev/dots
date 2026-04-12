{ pkgs, ... }:
{
  home.packages = with pkgs; [
    onefetch
    ncdu
    tldr
    tokei
    ripgrep
    rclone
    file
    zip
    unzip
    ffmpeg
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    btop.enable = true;
  };
}
