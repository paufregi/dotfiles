#####
# Path
#####
export PATH="/usr/local/sbin:$HOME/.bin:$PATH"

#####
# Source
#####
source ~/.zsh/git.zsh
source ~/.zsh/plugins.zsh

#####
# Color
#####
# ls - https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

#####
# Prompt
#####
setopt prompt_subst
PS1='%F{cyan}%n %F{red}@ %F{green}%c $(git_info)
%B%F{green}»%f%b '

#####
# History
#####
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt appendhistory        #Append history to the history file (no overwriting)
setopt sharehistory         #Share history across terminals
setopt incappendhistory     #Immediately append to the history file, not just when a term is killed


#####
# Key bindings
#####
bindkey "^[[3~"         delete-char
bindkey "^[3;5~"        delete-char
bindkey "^[^[[D"        backward-word
bindkey "^[^[[C"        forward-word
bindkey "^[a"           beginning-of-line
bindkey "^[e"           end-of-line
bindkey "^[[Z"          reverse-menu-complete

#####
# Alias
#####
unsetopt complete_aliases
alias ls="ls -G"
alias ..="cd .."
alias g="git"

alias docker-rm-all='docker rm -f $(docker ps -a -q)'
alias docker-rmi-all='docker rmi -f $(docker images -q)'
