{ pkgs, ... }:
{
  home.packages = with pkgs; [
    signal-desktop
    (
      discord.override {
        withOpenASAR = true;
        withVencord = true;
      }
    )
    twitch-tui
  ];

  programs.thunderbird = {
    enable = true;
    profiles.main = {
      isDefault = true;
    };
  };
}
