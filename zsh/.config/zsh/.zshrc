autoload -U colors && colors
#PS1="%B%n%F{137}@%f%m %F{148}%3d%f>%b "
PS1="%B%n%F{137}@%f%m %F{148}%3~%f/%(?.. %F{%?}[%?]%f%F{3}🗲%f )>%b "
export KEYTIMEOUT=1

export PATH=$HOME/.local/bin:$PATH

# check if aliasrc exists and source it
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

export DISPLAY=localhost:0.0


# source the zsh-syntax-highlighting plugin
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey -s "^f" 'cd "$(dirname "$(fzf)")"\n'
bindkey -s "^p" 'winopen "$(find -type f | grep ".pdf" | fzf)"\n'

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=* l:|=*' 'r:|[._-]=* r:|=*'
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.local/.cache/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v

autoload -Uz compinit
compinit

# Share between shell
setopt inc_append_history
setopt share_history

# enable comments in interactive prompt
setopt interactivecomments

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# dumb neofetch meme
#neofetch --memory_percent on --color_blocks off --disable Packages

# enable syntax highligting in man pages
# needs most (like less/more) installed
#export PAGER=most

