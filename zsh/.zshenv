[ -d /usr/X11 ] && PATH=/usr/X11/bin:/usr/X11/sbin:$PATH
[ -d /opt/local/bin ] && PATH=/opt/local/bin:/opt/local/sbin:$PATH
[ -d /usr/local/bin ] && PATH=/usr/local/bin:/usr/local/sbin:$PATH
[ -d $HOME/bin ] && PATH=$HOME/bin:$PATH
export PATH

[ -d /opt/local/share/man ] && MANPATH=/opt/local/share/man:$MANPATH
[ -d /usr/local/share/man ] && MANPATH=/usr/local/share/man:$MANPATH
export MANPATH

# rbenv
if [[ -d $HOME/.rbenv/bin ]] ; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
else
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
fi

# chruby
if [[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]]; then
    source /usr/local/opt/chruby/share/chruby/chruby.sh
    source /usr/local/opt/chruby/share/chruby/auto.sh
fi

# nodenv
if [[ -d $HOME/.nodenv ]] ; then
    eval "$(nodenv init -)"
fi

export GOPATH=${HOME}/src/go
export PATH=${GOPATH}/bin:$PATH

if [ -d /Applications/Emacs.app ]; then
    EMACS='/Applications/Emacs.app'
else
    EMACS='/Users/dgoodlad/Applications/Emacs.app'
fi

alias es="/usr/local/opt/emacs/bin/emacs --daemon"
alias emacs="/usr/local/opt/emacs/bin/emacsclient -nw"
export EDITOR="/usr/local/opt/emacs/bin/emacsclient -a '' -nw"
