{ pkgs, username, zen-browser, ... }:
{
  imports = [
    ./bash
    ./git
    ./fastfetch
    ./hyfetch
    ./tmux
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
    ];

  };
  programs = {
    direnv = {
      # Move
      enable = true;
      nix-direnv.enable = true;
    };
    btop.enable = true; # Move
  };
}
