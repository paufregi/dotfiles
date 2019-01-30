#####
# Plugin
#####

source ~/.zsh/repos/zsh-completions/zsh-completions.plugin.zsh
source ~/.zsh/repos/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/repos/zsh-history-substring-search/zsh-history-substring-search.zsh

######
# Settings
######

# zsh-completions
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:descriptions' format '%F{yellow}%B-- %d%b%f'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*' group-name ''

fpath=(~/.zsh/completions ~/.zsh/zsh-completions/src $fpath)
autoload -U compinit && compinit

# zsh-syntax-highlighting
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd

# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=default,underline"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=default,underline"
HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'
HISTORY_SUBSTRING_SEARCH_FUZZY='true'
HIST_IGNORE_ALL_DUPS='true'