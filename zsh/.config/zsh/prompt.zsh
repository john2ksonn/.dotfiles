autoload -U colors && colors
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

#PS1="%B%n%F{137}@%f%m %F{148}%3d%f>%b "
PROMPT="%B%n%F{137}@%f%m %F{148}%3~%f/%(?.. %F{%?}[%?]%f%F{3}🗲%f )>%b "
RPROMPT='%F{199}${vcs_info_msg_0_}%f %T'
zstyle ':vcs_info:git:*' formats '%b'
