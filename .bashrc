export EDITOR=/usr/local/bin/nvim
export TERM=xterm-256color

#
# Begin ssh-agent hack.
#
SSH_ENVIRONMENT=~/.ssh/environment

start_agent() {
    printf 'Starting ssh-agent...'
    ssh-agent | sed '/^echo /d' > "${SSH_ENVIRONMENT}"
    chmod 600 "${SSH_ENVIRONMENT}"
    echo 'done.'
    . "${SSH_ENVIRONMENT}" > /dev/null
    ssh-add
}

if [ -f "${SSH_ENVIRONMENT}" ]; then
    . "${SSH_ENVIRONMENT}" > /dev/null
    ps "${SSH_AGENT_PID}" > /dev/null || start_agent
else
    start_agent
fi
#
# End ssh-agent hack.
#

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}

complete -o default -F _pip_completion pip
# pip bash completion end

# Git command completion start
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
# Git command completion ends

# Django command completion start
if [ -f ~/.django-completion.bash ]; then
  . ~/.django-completion.bash
fi
# Django command completion ends

# Brew packages command completion start
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi
# Brew packages command completion end

# Pipx autocompletion
eval "$(register-python-argcomplete pipx)"
