# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gianu"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# jump plugin
export MARKPATH=$HOME/.marks
function jump {
cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
  }
  function mark {
  mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
rm -i $MARKPATH/$1
  }
  function marks {
  ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

function _completemarks {
reply=($(ls $MARKPATH))
}

compctl -K _completemarks jump
compctl -K _completemarks unmark

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler capistrano cp rbenv gem nyan rails zeus)

source $ZSH/oh-my-zsh.sh
export EDITOR=vim

# stop it from annoying autocorrects
unsetopt correct_all

bindkey '^j' undefined-key
bindkey '^k' undefined-key
bindkey '^l' undefined-key
bindkey '^h' undefined-key

alias ls='ls -G'
alias c="clear"
alias j='jump'
alias gu='git up'
alias rdbr='bundle exec rake db:recreate'
alias gg='git grep'
alias t='tmux'
alias tn='tmux new'
alias ta='tmux attach'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias bash_profile='vim ~/.bash_profile'
alias ssh='TERM=xterm ssh'
alias g20="git for-each-ref --count=20 --sort=-committerdate refs/heads/ --format='Branch: %(refname:short) | Author: %(authoremail) | Date: %(authordate:short)'"
alias gh="git for-each-ref --sort='authordate:iso8601' --format=' %(authordate:relative)%09%(refname:short)' refs/heads"
alias v="vim"
alias mux="tmuxinator"

bindkey -v
bindkey -M viins ‘jj’ vi-cmd-mode
bindkey '^R' history-incremental-search-backward

# mode switch delay
export KEYTIMEOUT=1

# VI mode indicator
vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
# Thanks Ron! (see comments)
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}

RPROMPT='${vim_mode}'
RPROMPT2='${vim_mode}'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export RAILS_MYSQL_USER="root"
export RAILS_MYSQL_PASSWORD=""

export RAILS_PGSQL_USER="root"
export RAILS_PGSQL_PASSWORD=""
