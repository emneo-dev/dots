alias ls="ls --color"
alias l="ls --color -lh"
alias ll="ls --color -lah"

alias h="echo h"
# I hate perf so much for this >:(
alias perfrep="perf report -g 'graph,0.5,caller'"
alias perfrec="perf record -g"

# Bash's time is shit, just use GNU time
alias time='$(which time) -v'

# Zig alias
alias zb="zig build --summary all"
alias zbr="zig build -Doptimize=ReleaseSafe --summary all"

alias wttr="curl https://wttr.in/toulouse"
alias ff="fastfetch"
alias ncdu="ncdu --color dark"
alias xn="nix run github:b3nj5m1n/xdg-ninja"
alias rrc='. $HOME/.bashrc'
