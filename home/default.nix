{ username, ... }:
{
  imports = [
    ./bash
    ./git
    ./fastfetch
    ./hyfetch
    ./tmux
    ./nvim
    ./cli.nix
    ./desktop.nix
    ./gaming.nix
    ./media.nix
    ./communication.nix
    ./dev.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    stateVersion = "25.11";
  };
}
