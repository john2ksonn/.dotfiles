autoload -U colors && colors
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

#PS1="%B%n%F{137}@%f%m %F{148}%3d%f>%b "
PROMPT="%B%n%F{137}@%f%m %F{148}%3~%f/%(?.. %F{%?}[%?]%f%F{3}🗲%f )>%b "

setopt prompt_subst
. $HOME/.config/zsh/git-prompt.sh
#RPROMPT=$'%F{199}$(__git_ps1 "%s")%f %T'
export RPROMPT=$'%F{199}$(__git_ps1 "%s")%f %F{199}%T%f'

