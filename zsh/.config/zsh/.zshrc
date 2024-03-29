source $HOME/.config/zsh/prompt.zsh

export KEYTIMEOUT=1

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/scripts

export GOBIN=$HOME/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOBIN

export PATH=$PATH:$HOME/.platformio/penv/bin

export EDITOR=nvim

# check if aliasrc exists and source it
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# source the zsh-syntax-highlighting plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey -s "^f" 'cd "$(dirname "$(fzf)")"\n'
#bindkey -s "^p" 'xdg-open "$(find -type f -filename "*.pdf" | grep ".pdf" | fzf)"\n'
#bindkey -s "^p" "xdg-open \"\$(find -type f -filename '*.pdf' | sort | fzf)\"\n"
bindkey -s "^p" "xdg-open \"\$(find -type f -name '*.pdf' | sort | fzf)\"\n"

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
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt share_history
setopt histignorespace                                          # Don't save commands that start with space

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

