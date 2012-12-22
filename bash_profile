source ~/.aliases
source $HOME/.prowl_api

for file in ~/.{aliases,prowl_api}; do
	[ -r "$file" ] && source "$file"
done
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export PATH="$PATH:/Users/$User/Scripts"
export PATH="$PATH:/Users/$USER/Ruby"
export PATH="$PATH:/Users/$USER/Bash"
export PATH="/usr/local/bin:$PATH"
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1
export LSCOLORS=dxfxhxGxFxexexaxaxaxax
export HISTCONTROL=ignoredups
CDPATH=".:~:~/Library"

set -o vi

shopt -s cdspell
shopt -s histappend

HISTCONTROL=ignoreboth
HISTSIZE=5000

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards

[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion


# notify via prowl when an ssh connection is made
if [[ -n "$SSH_CLIENT" ]] ; then  curl --silent https://prowl.weks.net/publicapi/add -F apikey="$PAPI" -F priority=2 -F application="SSH-Notify" -F event="SSH Connection" -F description="$SSH_CLIENT""  has made an ssh connection to `hostname`" >/dev/null 2>&1; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
