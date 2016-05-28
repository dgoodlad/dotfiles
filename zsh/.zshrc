# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

if [[ ! -d $ZSH ]]; then
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh $ZSH || {
        printf "Error: git clone of oh-my-zsh repo failed.\n"
    }
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting brew cap gem lein rails redis-cli vagrant vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Git aliases
alias gfo='git fetch origin'
alias gsu='git submodule update'
alias b='git checkout -b'
alias glog='git log --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
alias gl='glog --graph'
alias gm='git merge --no-ff'
alias gmf='git merge --ff-only'
alias gs='git show'
alias gst='git status -b -s'
alias gap='git add -p'
alias git-cleanup="git branch --merged origin/master | grep -v \"master\" | grep -v '*' | xargs git branch -d"

if [[ -x `which hub` ]]; then
    alias git=hub
fi

if [[ -f /usr/local/share/zsh/site-functions/_aws ]]; then
    source /usr/local/share/zsh/site-functions/_aws
fi

if [[ -x /usr/bin/keychain ]]; then
  eval `keychain --eval --nogui -Q -q --noask`
fi

# Enable custom OSX Terminal colors
export CLICOLOR=1

alias rg='rails generate'
alias rc='rails console'
alias rs='rails server thin'

alias gmom='git merge origin/master'

alias markdown='kramdown'

# Tmux aliases

function tmux_win() {
    name=$1
    cwd=$2

    if ! tmux find-window -N $name; then
        tmux new-window -c $cwd -n $name
    fi
}

function boxen_project() {
  name=$1
  dir="${HOME}/src/boxen/${name}"

  [[ ! -d $dir ]] && git clone https://github.com/boxen/${name} $dir
  cd $dir
}

[[ -f /opt/boxen/env.sh ]] && source /opt/boxen/env.sh
