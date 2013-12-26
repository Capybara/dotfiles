#Bash Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
bindkey -M viins 'jj' vi-cmd-mode
#Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode pass rvm brew osx history git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
# source 
# Customize to your needs...
# COMPLETION SETTINGS
# add custom completion scripts
fpath=(~/.zsh/completion $fpath) 

# compsys initialization
autoload -U compinit
compinit -u

# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2

# set Director for Pass unix password manager
#export PASSWORD_STORE_DIR=/Volumes/safe
#export PASSWORD_STORE_KEY="j@pass"

export PROMPT='%{$fg[black]%}%{$bg_bold[cyan]%}%m %{$bg_bold[red]%}%{$fg_bold[green]%}%p %{$fg[cyan]%} %c  %{$bg_bold[default]%} % %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$fg_bold[cyan]%}%n➜%{$reset_color%} '

# Set Path to directories if they exist
path+=(/usr/bin /bin /usr/sbin /sbin /opt/X11/bin /usr/local/git/bin $HOME/Scripts $HOME/Ruby $HOME/Bash $HOME/Testing (N-/))
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export EDITOR="vim --noplugin"

for file in ~/.{aliases,prowl_api,gnupg/agent_script}; do
  [ -r "$file" ] && source "$file"
done

# notify via prowl when an ssh connection is made
if [[ -n "$SSH_CLIENT" ]] ; then  curl --silent https://prowl.weks.net/publicapi/add -F apikey="$PAPI" -F priority=2 -F application="SSH-Notify" -F event="SSH Connection" -F description="$SSH_CLIENT""  has made an ssh connection to `hostname`" >/dev/null 2>&1; fi

zstyle ":completion:*:descriptions" format "%B%d%b"

#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# use gpg completion for gpg2 until there is an update
compdef gpg2=gpg

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load     RVM into a shell session *as a function*


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
/usr/bin/clear
