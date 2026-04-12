{ pkgs, ... }:
{
  home.file = {
    nvim_conf = {
      source = ./lua;
      target = ".config/nvim/lua";
      recursive = true;
    };

    clang_tidy = {
      source = ./.clang-tidy;
      target = ".clang-tidy";
    };

    clangd = {
      source = ./.clangd;
      target = ".clangd";
    };
  };

  programs.neovim = {
    enable = true;
    withRuby = false;
    withPython3 = false;

    initLua = ''require("emneo")'';
    plugins = [ pkgs.vimPlugins.lazy-nvim ];

    extraPackages = with pkgs; [
      nil
      lua-language-server
      pyright
      clang-tools
      llvmPackages_latest.clang
      efm-langserver
      nodejs
      xclip
      zls
    ];
  };
}
