local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c $(virtualenv_prompt)%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "$my_gray(ssh) "
  fi
}

function virtualenv_prompt(){
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "%{$fg_bold[blue]%}($my_orange${VIRTUAL_ENV:t}%{$fg_bold[blue]%})"
}

# right prompt
RPROMPT='$(ssh_connection) $my_gray%n@%m%{$reset_color%}% '

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

