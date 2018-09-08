# Setting up standard path for configuration.
export XDG_CONFIG_HOME="$HOME/.config"

# Managing Linux packages in the absence of brew or another
# package manager.
if [[ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]]; then
  source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# Setting up editor.
export EDITOR=`which nvim`
alias vim="$EDITOR"

# Fuzzy searching with FZF.
if [[ -f "$HOME/.fzf.zsh" ]]; then
  source "$HOME/.fzf.zsh"
fi

# Forcing SSH protocol version 2 which is safer.
ssh() {
  /usr/bin/ssh -2 $*;
}

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

# Eclim.
# Assumes eclimd-path to be available (most likely with a sym link).
function eclim() {
   $HOME/eclipse/eclimd-path/eclimd -Dosgi.instance.area.default=$1 -Dnailgun.server.port=$2
}

