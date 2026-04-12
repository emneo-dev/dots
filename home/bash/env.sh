# Sets the prompt
# Literally the default from gentoo
# Taken from: https://gitweb.gentoo.org/repo/gentoo.git/tree/app-shells/bash/files/bashrc
# Just changed it so that it shows the full hostname (Distrobox for example)
PS1="\[\033[01;32m\]\u@\H\[\033[01;34m\] \w \$\[\033[00m\] "

# gpg signing in terminal without a secrets manager
GPG_TTY=$(tty)
export GPG_TTY
