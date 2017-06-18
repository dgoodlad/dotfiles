[ -d /usr/X11 ] && PATH=/usr/X11/bin:/usr/X11/sbin:$PATH
[ -d /opt/local/bin ] && PATH=/opt/local/bin:/opt/local/sbin:$PATH
[ -d /usr/local/bin ] && PATH=/usr/local/bin:/usr/local/sbin:$PATH
[ -d $HOME/bin ] && PATH=$HOME/bin:$PATH
[ -d $HOME/.nodenv ] && PATH=$HOME/.nodenv/bin:$PATH
[ -d $HOME/.rbenv ] && PATH=$HOME/.rbenv/bin:$PATH
export PATH

[ -d /opt/local/share/man ] && MANPATH=/opt/local/share/man:$MANPATH
[ -d /usr/local/share/man ] && MANPATH=/usr/local/share/man:$MANPATH
export MANPATH

# gpg-agent
#[ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
#if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
#    export GPG_AGENT_INFO
#else
#    eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
#fi
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
    gpgconf --launch gpg-agent
fi

case $OSTYPE in
    linux-gnu)
        export AWS_VAULT_BACKEND=secret-service
        ;;
    darwin*)
        export AWS_VAULT_BACKEND=keychain
        ;;
esac



if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start --components=pkcs11,secrets)
fi

# rbenv
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# chruby
if [[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]]; then
    source /usr/local/opt/chruby/share/chruby/chruby.sh
    source /usr/local/opt/chruby/share/chruby/auto.sh
elif [[ -f /usr/share/chruby/chruby.sh ]]; then
    source /usr/share/chruby/chruby.sh
    source /usr/share/chruby/auto.sh
fi

# nodenv
if which nodenv > /dev/null; then
    eval "$(nodenv init -)"
fi

export GOPATH=${HOME}/src/go
export PATH=${GOPATH}/bin:$PATH

case $OSTYPE in
    darwin*)
        if [ -d /Applications/Emacs.app ]; then
            EMACS='/Applications/Emacs.app'
        else
            EMACS='/Users/dgoodlad/Applications/Emacs.app'
        fi
        export EMACSCLIENT=$EMACS/Contents/MacOS/bin/emacsclient
        alias emacsclient=$EMACSCLIENT
        ;;
    *)
        export EMACSCLIENT=emacsclient
        ;;
esac
alias ec="$EMACSCLIENT -c -n"
export EDITOR="$EMACSCLIENT -c"
export ALTERNATE_EDITOR="/usr/bin/vim"
export VISUAL=$EDITOR
