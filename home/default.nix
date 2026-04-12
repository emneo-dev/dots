{ pkgs, username, zen-browser, ... }:
{
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
      tldr
      tokei
      ripgrep
      rclone
      file
      zip
      unzip
      ffmpeg
      ghostty
      zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      gnupg
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
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      gnome-tweaks
      openmw
      davinci-resolve
      minion
      llama-cpp-vulkan
      obsidian
      mullvad-vpn
      anki
      talosctl
      kubectl
      kubernetes-helm
      obs-studio
      ladybird
      twitch-tui
      gh
    ];

  };
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    btop.enable = true;
    opencode.enable = true;
    claude-code.enable = true;
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
