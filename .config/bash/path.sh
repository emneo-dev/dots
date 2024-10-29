# User specific environment
PATH=$HOME/.local/bin:$HOME/opt/bin:$PATH

# Go binaries
PATH=$HOME/go/bin:$PATH

# Rust's way of doing things
. "$HOME/.cargo/env"

# Bun stuff
PATH=$BUN_INSTALL/bin:$PATH

# pnpm
PATH=$HOME/.local/share/pnpm:$PATH

export PATH
