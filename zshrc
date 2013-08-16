# Path to your oh-my-zsh configuration.
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
plugins=(vi-mode pass rvm brew osx history git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# COMPLETION SETTINGS
# add custom completion scripts
fpath=(~/.zsh/completion $fpath) 

source ~/.profile
# compsys initialization
autoload -U compinit
compinit

# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2

export PROMPT='%{$fg[black]%}%{$bg_bold[cyan]%}$(~/dotfiles/prompt/find_proj.rb)%{$bg_bold[red]%}%{$fg_bold[green]%}%p %{$fg[cyan]%} %c  %{$bg_bold[default]%} % %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
%{$fg_bold[cyan]%}%n➜%{$reset_color%} '

export PATH=$PATH/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/Users/$USER/Scripts:/Users/$USER/Ruby:/Users/$USER/Bash
export EDITOR=vim
for file in ~/.{aliases,prowl_api}; do
  [ -r "$file" ] && source "$file"
done
# notify via prowl when an ssh connection is made
if [[ -n "$SSH_CLIENT" ]] ; then  curl --silent https://prowl.weks.net/publi    capi/add -F apikey="$PAPI" -F priority=2 -F application="SSH-Notify" -F even    t="SSH Connection" -F description="$SSH_CLIENT""  has made an ssh connection     to `hostname`" >/dev/null 2>&1; fi

zstyle ":completion:*:descriptions" format "%B%d%b"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load     RVM into a shell session *as a function*


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
