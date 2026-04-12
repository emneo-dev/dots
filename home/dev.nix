{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dbeaver-bin
    imhex
    jetbrains.idea
    talosctl
    kubectl
    kubernetes-helm
    llama-cpp-vulkan
  ];

  programs = {
    gh.enable = true;
    opencode.enable = true;
    claude-code.enable = true;
  };
}
