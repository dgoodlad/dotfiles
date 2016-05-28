#!/bin/bash

set -e
set -o pipefail

abort() { echo "!!! $*" >&2; exit 1; }
log()   { echo "--> $*"; }
logn()  { printf -- "--> $* "; }
logk()  { echo "OK"; }

readonly dotfiles="${HOME}/.dotfiles"
if [[ ! -d $dotfiles ]]; then
    log "Cloning dotfiles:"
    git clone https://github.com/dgoodlad/dotfiles $dotfiles
    logk
fi

which stow 2>&1 >/dev/null || {
    abort "Missing GNU stow; please install it then re-run $0"
}

pushd ${dotfiles} >/dev/null

log "Installing OS-independent dotfiles:"
stow emacs
stow git
stow mail
stow mutt
stow readline
stow ruby
stow tmux
stow util
stow vim
stow zsh
logk

if [ ! -d $HOME/.emacs.d ]; then
    log "Installing spacemacs:"
    git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
    logk
fi

if [ ! -d $HOME/.oh-my-zsh ]; then
    log "Installing oh-my-zsh:"
    git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
    logk
fi

readonly os=$(uname -s)
log "Installing dotfiles for ${os}"
if [[ "${os}" == "Darwin" ]]; then
    stow osx
else
    stow X11
    stow awesome
fi
logk

popd >/dev/null
