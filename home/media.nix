{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vlc
    handbrake
    supersonic
    ani-cli
    gimp
    blender
    davinci-resolve
  ];

  programs.obs-studio.enable = true;
}
