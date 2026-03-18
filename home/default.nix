{ pkgs, username, zen-browser, jackify, nix-gaming, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
    rocmSupport = true;
  };

  imports = [
    ./bash
    ./git
    ./fastfetch
    ./hyfetch
    ./tmux
    ./nvim
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    stateVersion = "25.11";

    packages = with pkgs; [
      onefetch
      ncdu
      tldr # Move
      tokei
      ripgrep # Move?
      rclone # Move?
      file
      zip
      unzip
      ffmpeg
      ghostty # Move
      zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      jackify.packages.${pkgs.stdenv.hostPlatform.system}.default
      nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.mo2installer
      gnupg # Move
      prismlauncher
      jetbrains.idea
      steam
      flatpak
      handbrake
      signal-desktop
      osu-lazer-bin
      qbittorrent
      gimp
      vlc
      vintagestory
      ocelot-desktop
      imhex
      ani-cli
      supersonic
      blender
      (
        discord.override {
          withOpenASAR = true;
          withVencord = true;
        }
      )
      libreoffice
      mediawriter
      dbeaver-bin
      protontricks
      freetype
      nerd-fonts.jetbrains-mono
    ];

  };
  programs = {
    direnv = {
      # Move
      enable = true;
      nix-direnv.enable = true;
    };
    btop.enable = true; # Move
    opencode.enable = true;
    thunderbird = {
      enable = true;
      profiles.main = {
        isDefault = true;
      };
    };
    lutris = {
      enable = true;
      defaultWinePackage = pkgs.proton-ge-bin;
    };
  };
}
