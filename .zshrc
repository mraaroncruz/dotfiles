#unsetopt correct_all
unsetopt correct

#
# Place this code to your .profile, .bashrc, .bash_profile or whatever
#

program_exists () {
	type "$1" &> /dev/null ;
}

if program_exists go; then
	function setupGOROOT()
	{
		local GOPATH=`which go`
		local GODIR=`dirname $GOPATH`
		local GOPATH_BREW_RELATIVE=`readlink $GOPATH`
		local GOPATH_BREW=`dirname $GOPATH_BREW_RELATIVE`
		export GOROOT=`cd $GODIR; cd $GOPATH_BREW/..; pwd`
	}
	setupGOROOT
fi
# Customize to your needs...
export PATH=$HOME/.dotfiles/tools:$HOME/bin:/usr/local/share/npm/bin:/usr/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# Android SDK
export PATH=/usr/local/android/sdk/platform-tools:/usr/local/android/sdk/tools:$PATH

if [ -d "$HOME/.rbenv" ]; then
  export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi

# Derp derp
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# Rubygems cache proxy
export GEM_SOURCE=http://yarp.dev

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export EDITOR=vim
export VISUAL=vim

# Edit this file
alias zrc="vim ~/.zshrc && source ~/.zshrc"

export_local_env_vars () {
  for line in `cat .env`
  do
    echo $line
    export $line
  done
}

cd() {
  builtin cd $*
  if [ -f .env ]
  then
    export_local_env_vars
  fi
  if [ -f .project ]
  then
    . ./.project
  fi
}


# Edit vimrc
alias vimrc="vim $HOME/.vimrc"

# Fix gst issue
alias smalltalk="/usr/local/bin/gst"

# Handy folders
alias code="cd $HOME/Code"
alias repo="cd $HOME/Repo"
alias hack="cd $HOME/Hack"
alias dotfiles="cd $HOME/.dotfiles"

# PHONEGAP
alias pg="phonegap"
alias pgb="phonegap build"
alias pgbi="phonegap build ios"
alias pgba="phonegap build android"
alias pgii="phonegap install ios"
alias pgia="phonegap install android"
alias pgri="phonegap run ios"
alias pgra="phonegap run android"

# GIT
alias gp="git push"
alias gpu="git push -u origin master"
alias gf="git fetch"
alias gm="git merge origin/master"
alias gco="git checkout"
alias gst="git status"
alias gsta="git stash"
alias gstp="git stash pop"
alias gcob="git checkout -b"
alias gaa="git add --all"
cm () {
 git commit -m "$*";
}
alias gca="git commit --ammend"
alias gl="git log"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset %an -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias sta="git status"

alias hpush="git push heroku master"

alias spk="bundle exec spork cucumber & bundle exec spork"
alias iphone="open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"
alias sstr="sudo apachectl start"
alias sstp="sudo apachectl stop"
alias srt="sudo apachectl restart"
alias nstart="sudo nginx"
alias nstop="sudo nginx -s stop"
alias nreload="sudo nginx -s reload"
alias nstat="sudo lsof -i -P"
alias x='chmod +x $1'


# Vagrant
alias vu='vagrant up'
alias vun='vagrant up --no-provision'
alias vr='vagrant reload'
alias vrn='vagrant reload --no-provision'
alias vh='vagrant halt'
alias vs='vagrant suspend'
alias vssh='vagrant ssh'

# Capistrano
alias dp='cap deploy'

# Projects
function proj () {
  current=~/.config/consular/current
  if [[ -n $1 ]]; then
    echo "Starting $1..."
    consular start $1
    return
  fi
  if [[ -f "$current" ]]; then
    project=`cat $current`
    echo "Starting $project..."
    consular start $project
    return
  fi
}

function setproj () {
  current=~/.config/consular/current
  if [ -f "$current" ]; then rm -f $current; fi
  echo $1 > $current
}

# Projects
function proj () {
  current=~/.config/consular/current
  if [[ -n $1 ]]; then
    echo "Starting $1..."
    consular start $1
    return
  fi
  if [[ -f "$current" ]]; then
    project=`cat $current`
    echo "Starting $project..."
    consular start $project
    return
  fi
}

function setproj () {
  current=~/.config/consular/current
  if [ -f "$current" ]; then rm -f $current; fi
  echo $1 > $current
}

# Ruby Apps
alias prodlog="tail -n 300 -f log/production.log"
alias devlog="tail -n 300 -f log/development.log"
alias staglog="tail -n 300 -f log/staging.log"

alias phpdoc="thor php:open"

alias powstop="curl get.pow.cx/uninstall.sh | sh"
alias powstart="curl get.pow.cx | sh"

alias g="git"
alias ports="sudo lsof -i -P"
export EDITOR="vim"
## terminal color fun
export CLICOLOR=1
#export LSCOLORS=caFxCxDxBxegedabagacad
alias ll='ls -h1'
alias lt='ls -lTsSa'
alias lll='ls'
alias lsl="ls -lG"
alias lsla="ls -laG"
alias shortcuts="bind -P | less"

alias nodedoc="open /usr/local/src/nodejs_all/node-v0.3.0/doc/api.html"

alias v="vim ."
alias m="mvim ."
alias s.="open -a 'Sublime Text 2' ."
alias s="open -a 'Sublime Text 2'"
alias duh='du -csh'
alias b="bundle"
alias bi="bundle install --binstubs --without production"
alias bu="bundle update"
alias bc="bundle check"
alias be="bundle exec"
alias bo="bundle open"
alias grd="bundle exec guard"

alias bwin="bower install --save"
alias bwit="bower init"
alias bws="bower search"
alias bwu="bower uninstall"
alias bwcat="cat bower.json"


alias migrate="rake db:migrate"
alias dpl="cap deploy"

alias nsta="sudo nginx"
alias nsto="sudo nginx -s stop"
alias nres="sudo nginx -s reload"
alias ntest="sudo nginx -t $*"

alias rbgrep="grep --include='*.rb' $*"
alias r="bundle exec rails"
alias rc="bundle exec rails console"
alias rcp="bundle exec rails console production"
alias rct="bundle exec rails console test"
alias rdb="bundle exec rails dbconsole"
alias rdbm="bundle exec rake db:migrate db:test:prepare"
alias rdbr="bundle exec rake db:rollback"

alias uni="bundle exec unicorn -p 3000"
alias pm="bundle exec puma -p 3000"

alias rr='rbenv rehash'

alias cpl="bundle exec rake assets:precompile"
alias clean="budle exec rake assets:clean"

# yeoman
angular() {
  if [ $1 = "scaffold" ]
  then
    yo angular:service $2 --minsafe --coffee

    yo angular:route $2_index --minsafe --coffee
    yo angular:route $2_new   --minsafe --coffee
    yo angular:route $2_edit  --minsafe --coffee

  else
    yo angular:$1 $2 --minsafe --coffee
  fi
}
alias ng="angular"
alias nginit="yo angular --coffee"
alias gt="grunt --stack"

# MISC TOOLS
alias ac="acruz shorten"
alias server="python -m SimpleHTTPServer"

# SYSTEM
mcd () {
    mkdir -p "$@" && cd "$@"
}
alias mkc=mcd

alias t="TERM=screen-256color-bce tmux"
function tcwd () {
  tmux set-option default-path $PWD
}

alias start='consular start'
alias edit='consular edit'
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers"
fs () {
  if test -f ./Procfile.development
  then
    bundle exec foreman start -f Procfile.development
  else
    bundle exec foreman start
  fi
}
alias gemspeed='bundle exec ruby -e "$(curl -fsSL https://gist.github.com/raw/2588879/benchmark.rb)" | sort -n -k4'
alias i="identify"
alias srv="http-server -p 3001"
# Handy Functions
c() { cd ~/Projects/$1;  }

_c() { _files -W ~/Projects -/; }
compdef _c c

# Z
. $HOME/.dotfiles/tools/z/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

function ghsearch {
  open "https://github.com/search?q=$1&type=Everything&repo=&langOverride=&start_value=1"
}
function ww {
  # $1 is command, $2 is interval
  while true; do clear; date;echo;eval $1; sleep $2; done;
}

function geo {
  geocode $1 | grep L
}

# Get ActiveRecord table columns for model
function model {
  cat db/schema.rb | grep "create_table \"$1s\"" -A 1000 | \
    while read line; do
      if [ -z "$line" ]
      then
        break
      elif [[ "$line" = "end" || "$line" =~ "create_table" ]]
      then continue
      else
        echo $line
      fi
    done
}

# ACTUAL CUSTOMIZATION OH NOES!
bindkey "^[[3~" delete-char

function routes() {
  if [ -n "$1" ]; then
    bundle exec rake routes | grep $1
  else
    bundle exec rake routes
  fi
}

function cdf() { cd *$1*/ } # stolen from @topfunky
# Originally from Jonathan Penn, with modifications by Gary Bernhardt
function whodoneit() {
    (set -e &&
        for x in $(git grep -I --name-only $1); do
            git blame -f -- $x | grep $1;
        done
    )
}

# Mindster
mstage() {
  heroku $1 $2 --app mindster-staging
}

mprod() {
  heroku $1 $2 --app mindstertalent
}

alias mdeploys="git push staging master"
alias mdeployp="git push heroku master"

# Git tab completion
# source ~/.git-completion.bash

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export WORDCHARS='*?[]~&;!$%^<>'
export ACK_COLOR_MATCH='red'
# Rails perf increase https://gist.github.com/1688857
<<<<<<< HEAD
<<<<<<< HEAD
#export RUBY_HEAP_MIN_SLOTS=1000000
=======
>>>>>>> origin/osx
=======
>>>>>>> f73fdfdb517a500224689e9baa2023ccb3c896e0
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
