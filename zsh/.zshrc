#####
# Path
#####
export PATH="/usr/local/sbin:$HOME/.bin:$PATH"

#####
# Source
#####
source ~/.zsh/git.zsh
source ~/.zsh/plugins.zsh
source ~/.zsh/settings.zsh

#####
# Alias
#####
alias ls="ls -G"
alias ..="cd .."
alias g="git"

alias docker-rm-all='docker rm -f $(docker ps -a -q)'
alias docker-rmi-all='docker rmi -f $(docker images -q)'
