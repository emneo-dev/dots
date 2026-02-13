{ pkgs, username, zen-browser, ... }:
{
  nixpkgs.config.allowUnfree = true;

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
      gnupg # Move
      vesktop # Move
      prismlauncher
      jetbrains.idea
      steam
      flatpak
      handbrake
      signal-desktop
      solaar
      osu-lazer
      qbittorrent
      gimp
      vlc
      vintagestory
      ocelot-desktop
      imhex
      ani-cli
      supersonic-wayland
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
  };
}
