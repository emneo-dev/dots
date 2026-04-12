{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dbeaver-bin
    imhex
    gh
    jetbrains.idea
    talosctl
    kubectl
    kubernetes-helm
    llama-cpp-vulkan
  ];

  programs = {
    opencode.enable = true;
    claude-code.enable = true;
  };
}
