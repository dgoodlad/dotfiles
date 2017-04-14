# On Arch, /etc/zsh/zprofile sources /etc/profile.d/*.sh which fucks with our PATH
# We need to re-read zshenv to get it back
source "${ZDOTDIR:-$HOME}/.zshenv"
