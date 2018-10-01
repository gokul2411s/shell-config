# Setting up standard path for configuration.
export XDG_CONFIG_HOME="$HOME/.config"

# Managing Linux packages in the absence of brew or another
# package manager.
if [[ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]]; then
  source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

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
# Assumes Eclim to be installed at $ECLIPSE_HOME/eclimd.
function eclim() {
  oldpwd=$(pwd)
  cd "$ECLIPSE_HOME"
  ./eclimd -Dosgi.instance.area.default=$1 -Dnailgun.server.port=$2
  cd "$oldpwd"
}

# Email.
alias gmail="neomutt -F $HOME/mail-config/common-mail-config/neomutt/.neomuttrc"

# News.
alias news="newsboat -u $HOME/news-config/newsboat/urls -C $HOME/news-config/newsboat/config"

# That's just for fun...
ddate

