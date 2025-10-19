# Sets the prompt
# Literally the default from gentoo
# Taken from: https://gitweb.gentoo.org/repo/gentoo.git/tree/app-shells/bash/files/bashrc
# Just changed it so that it shows the full hostname (Distrobox for example)
PS1="\[\033[01;32m\]\u@\H\[\033[01;34m\] \w \$\[\033[00m\] "

# Make go brrrrrrrr (You definetely want to change this if your pc doesn't have 16 cores and 32GB of RAM)
# MAKEFLAGS="-j$(nproc --ignore=2)"
export MAKEFLAGS

# gpg signing in terminal without a secrets manager
GPG_TTY=$(tty)
export GPG_TTY

export EDITOR=vim
export VISUAL=vim

export BUN_INSTALL="$HOME/.bun"

[ -f "/home/emneo/.ghcup/env" ] && . "/home/emneo/.ghcup/env" # ghcup-env
