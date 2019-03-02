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
    if (which brew 2>&1 >/dev/null); then
        brew install stow
    else
        abort "Missing GNU stow; please install it then re-run $0"
    fi
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

if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
    log "Installing Vundle.vim:"
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
    logk
fi

if [ ! -d $HOME/.rbenv ]; then
    echo "Installing rbenv"
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

if [ ! -d $HOME/.nodenv ]; then
    echo "Installing nodenv"
    git clone https://github.com/nodenv/nodenv.git ~/.nodenv
    git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
fi

readonly os=$(uname -s)
log "Installing dotfiles for ${os}"
if [[ "${os}" == "Darwin" ]]; then
    stow osx
else
    stow X11
    stow awesome
    stow herbstluftwm
fi
logk

log "Installing nerdfonts"
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/.nerd-fonts
pushd ~/.nerd-fonts
./install.sh
popd

popd >/dev/null
