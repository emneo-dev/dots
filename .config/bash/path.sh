# User specific environment
PATH=$HOME/.local/bin:$HOME/opt/bin:$PATH

# Rust's way of doing things
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Flatpaks
PATH=/var/lib/flatpak/exports/bin/:$PATH

export PATH
