HISTSIZE=5000
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export PATH="$PATH:/~/Scripts"
export PATH="$PATH:/Users/$USER/Ruby"
export PATH="$PATH:/Users/$USER/Bash"
export CLICOLOR=1
export LSCOLORS=dxfxhxGxFxexexaxaxaxax
CDPATH=".:~:~/Library"
alias pffw='tail -f /var/log/pffirewall.log'
alias affw='tail -f /var/log/applicationfirewall.log'
alias Tops='top -o cpu -s 5'
alias logs='cd /var/log ; ls'
alias scripts='cd /Users/$USER/Scripts ; ls'
alias Rub='cd /Users/$USER/Ruby ; ls'
alias Bas='cd /Users/$USER/Bash ; ls'
alias repair='diskutil repairPermissions /'
export HISTCONTROL=ignoredups

set -o vi

source $HOME/.prowl_api

if [[ -n "$SSH_CLIENT" ]] ; then  curl --silent https://prowl.weks.net/publicapi/add -F apikey="1b7952dcf26429c8496dba07730f2977523e3868" -F priority=2 -F application="SSH-Notify" -F event="SSH Connection" -F description="$SSH_CLIENT""  has made an ssh connection to `hostname`" >/dev/null 2>&1; fi

#alias mosh='mosh -a -server=/usr/local/bin/mosh-server'
alias tv='open http://10.0.1.8:{8080,5050,8081,8181}'
HISTCONTROL=ignoreboth

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
