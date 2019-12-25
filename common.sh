# Setting up standard path for configuration.
export XDG_CONFIG_HOME="$HOME/.config"

# Setting up editor.
export EDITOR=$(which nvim)
alias vim="$EDITOR"
alias vimdiff="nvim -d"

# Fuzzy searching with FZF.
if [[ -f "$HOME/.fzf.zsh" ]]; then
  source "$HOME/.fzf.zsh"
fi

# Forcing SSH protocol version 2 which is safer, and using X.
ssh() {
  /usr/bin/ssh -2 -X $*;
}

# For setting up SSH agent.
SSH_ENV="$HOME/.ssh/environment"
function _start_ssh_agent_unsafe() {
  echo "Initializing new SSH agent..."
  (umask 066; ssh-agent > "$SSH_ENV")
  source "$SSH_ENV" &> /dev/null
}

function start_ssh_agent() {

  if [ -f "${SSH_ENV}" ]; then
    source "${SSH_ENV}" &> /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent &> /dev/null || {
      _start_ssh_agent_unsafe
    }
  else
    _start_ssh_agent_unsafe
  fi
}
start_ssh_agent

# Going up the directory tree.
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias ..6="cd ../../../../../.."
alias ..7="cd ../../../../../../.."

# Creating a directory and cd'ing into it.
function mkcd() {
    mkdir -p "$1" && cd "$1";
}

