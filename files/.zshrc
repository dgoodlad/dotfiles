# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="Soliah"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
PATH=/usr/X11/bin:/usr/X11/sbin:$PATH
PATH=/opt/local/bin:/opt/local/sbin:$PATH
PATH=/opt/local/lib/mysql5/bin:$PATH
PATH=$HOME/bin:$PATH
MANPATH=/opt/local/share/man:$MANPATH
MANPATH=/usr/local/man:$MANPATH

export PATH
export MANPATH

export EDITOR=vim

# Git aliases
alias gfo='git fetch origin'
alias gsu='git submodule update'
alias b='git checkout -b'

# Don't show ~rvm_rvmrc_cwd as path when using rvm
unsetopt AUTO_NAME_DIRS
# Also required for rvm
setopt nullglob

# Ruby Version Manager
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

# Node Version Manager
if [[ -s $HOME/.nvm ]] ; then
  NVM_DIR=$HOME/.nvm
  source $NVM_DIR/nvm.sh
  nvm use
fi

# Enable custom OSX Terminal colors
export CLICOLOR=1

alias rg='rails generate'
alias rc='rails console'
alias rs='rails server thin'

alias gmom='git merge origin/master'
