#####
# Color
#####

## MacOS
# ls - https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

## Linux
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

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
