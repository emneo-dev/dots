{ pkgs, username, zen-browser, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./bash
    ./git
    ./fastfetch
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    sessionVariables = {
      EDITOR = "vim";
    };

    stateVersion = "25.11";

    packages = with pkgs; [
      onefetch
      tmux
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
      vesktop
      prismlauncher
    ];

  };
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    btop.enable = true;
  };

  services.gpg-agent.pinentry.package = pkgs.pinentry-curses;
}
