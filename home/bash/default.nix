{ ... }:
{
  home.sessionPath = [ "$HOME/.local/bin" "$HOME/opt/bin" ];

  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "ls --color";
      l = "ls --color -lh";
      ll = "ls --color -lah";
      h = "echo h";
      perfrep = "perf report -g 'graph,0.5,caller'";
      perfrec = "perf record -g";
      zb = "zig build --summary all";
      zbr = "zig build -Doptimize=ReleaseSafe --summary all";
      wttr = "curl https://wttr.in/toulouse";
      ff = "fastfetch";
      ncdu = "ncdu --color dark";
      xn = "nix run github:b3nj5m1n/xdg-ninja";
      rrc = ". $HOME/.bashrc";
      feh = "feh --scale-down";
      tmp = "pushd `mktemp -d`";
      todo = "vim ~/todo.txt";
      nixos-diff = "nix profile diff-closures --profile /nix/var/nix/profiles/system";
    };

    initExtra = ''
      # Bash options
      [[ -z "$FUNCNEST" ]] && export FUNCNEST=100
      shopt -s histappend
      shopt -s checkwinsize
      shopt -s dotglob
      shopt -s no_empty_cmd_completion

      # Prompt
      PS1="\[\033[01;32m\]\u@\H\[\033[01;34m\] \w \$\[\033[00m\] "

      # GPG signing in terminal
      GPG_TTY=$(tty)
      export GPG_TTY

      # Cargo
      [ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

      # We doing a little bit of trolling :3
      function mayhem() { sed -i "s/;/;/g" "$@"; }
      function rmayhem() { sed -i "s/;/;/g" "$@"; }

      function prune_branches() {
        git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
      }
    '';
  };
}
