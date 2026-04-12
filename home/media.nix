{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vlc
    handbrake
    obs-studio
    supersonic
    ani-cli
    gimp
    blender
    davinci-resolve
  ];
}
