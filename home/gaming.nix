{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
    steam
    osu-lazer-bin
    vintagestory
    ocelot-desktop
    openmw
    protontricks
    minion
  ];

  # programs.lutris = {
  #   enable = true;
  #   defaultWinePackage = pkgs.proton-ge-bin;
  # };
}
