{ ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      async-backend = "epoll";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 12;
      font-style = "semibold";
      theme = "Atom One Dark";
      shell-integration-features = "no-cursor,sudo,title";
      cursor-style-blink = false;
      maximize = false;
      window-padding-x = 1;
      window-padding-y = 1;
      window-padding-balance = true;
      window-padding-color = "extend";
      window-decoration = false;
      app-notifications = true;
      confirm-close-surface = false;
      resize-overlay = "never";
      gtk-single-instance = true;
      auto-update = "off";
      unfocused-split-opacity = 1;
      clipboard-read = "allow";
      copy-on-select = false;
    };
  };
}
