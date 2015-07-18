function _git_prompt_info {
    [[ -n $(whence git_prompt_info) ]] && git_prompt_info
}

function _rvm_prompt_info {
    if which rvm-prompt &> /dev/null; then
      rvm-prompt i v g
    else
      if which rbenv &> /dev/null; then
        rbenv version | sed -e "s/ (set.*$//"
      fi
    fi
}

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
local rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
local git_info='$(_git_prompt_info)%{$reset_color%}'

PROMPT="╭ ${user_host} ${current_dir} ${rvm_ruby} ${git_info}
╰ ➤ "


ZSH_THEME_GIT_PROMPT_PREFIX="‹%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔ %{$reset_color%}"

