#unsetopt correct_all
unsetopt correct
autoload zmv

#
# Place this code to your .profile, .bashrc, .bash_profile or whatever
#

alias h="hoodie start"

if [[ $TERM == xterm ]]; then
    TERM=xterm-256color
fi

program_exists () {
	type "$1" &> /dev/null ;
}

if program_exists go; then
	function setupGOROOT()
	{
        export GOPATH=$HOME/Go
        export PATH=$PATH:$GOPATH/bin
		#local GOPATH=`which go`
		#local GODIR=`dirname $GOPATH`
		#local GOPATH_BREW_RELATIVE=`readlink $GOPATH`
		#local GOPATH_BREW=`dirname $GOPATH_BREW_RELATIVE`
		#export GOROOT=`cd $GODIR; cd $GOPATH_BREW/..; pwd`
	}
	setupGOROOT
fi

# Customize to your needs...
export PATH=$GOPATH/bin:PATH:/usr/local/opt/go/libexec/bin:$HOME/.dotfiles/tools:$HOME/bin:/usr/local/opt/postgresql/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# Android SDK
#export PATH=/usr/local/opt/android-sdk/platform-tools:/usr/local/opt/android-sdk/tools:$PATH
#export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_HOME=/Users/aaron/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH

if [ -d "$HOME/.rbenv" ]; then
  export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi

# Derp derp
#export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# Rubygems cache proxy
#export GEM_SOURCE=http://yarp.dev

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
    #export $line
  done
}

# RAMDisk
ramdisk() {size=$(($1 * 2097152))
    diskutil eject /Volumes/ramdisk > /dev/null 2>&1
    diskutil erasevolume HFS+ 'ramdisk' `hdiutil attach -nomount ram://$size`
    cd /Volumes/ramdisk }

rdestroy() {hdiutil eject /Volumes/ramdisk}

# Pretty curl for JSON
alias curlj="curl --silent "$1" | prettyjson" 
# Curl headers only
alias curlh="curl -s -D - $1 -o /dev/null"

# Wrap cd because I'm a hacker
#cd() {
  #builtin cd $*
  #if [ -f .env ]
  #then
    #export_local_env_vars
  #fi
  #if [ -f .project ]
  #then
    #. ./.project
  #fi
#}

# PostgreSQL
pg () {
  DATA="$1"
  PORT=${2-5432}
  postgres -D $DATA -p $PORT
}

create-project-db () {
  U=$1
  DB=$2
  DBPATH=tmp/postgres
  PORT=9911

  initdb $DBPATH
  postgres -D $DBPATH -p $PORT &
  sleep 5
  PID=$!
  createuser -s -p $PORT $U
  createdb -p $PORT -O $U $DB
  echo "Created database $DB for user $U"

  kill -INT $PID
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
#alias pg="phonegap"
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
alias s="git status"
alias dif="git diff"
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

alias rubby="bundle exec ruby"
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
#function proj () {
  #current=~/.config/consular/current
  #if [[ -n $1 ]]; then
    #echo "Starting $1..."
    #consular start $1
    #return
  #fi
  #if [[ -f "$current" ]]; then
    #project=`cat $current`
    #echo "Starting $project..."
    #consular start $project
    #return
  #fi
#}
#
#function setproj () {
  #current=~/.config/consular/current
  #if [ -f "$current" ]; then rm -f $current; fi
  #echo $1 > $current
#}

alias proj="$PWD/bin/project"

function perf {
  curl -o /dev/null  -s -w "%{time_connect} + %{time_starttransfer} = %{time_total}\n" $@
}


# Ruby Apps
alias prodlog="tail -n 300 -f log/production.log"
alias devlog="tail -n 300 -f log/development.log"
alias staglog="tail -n 300 -f log/staging.log"

alias phpdoc="thor php:open"

alias powstop="curl get.pow.cx/uninstall.sh | sh"
alias powstart="curl get.pow.cx | sh"

alias g="hub"
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

alias v="mvim -v ."
alias sub="open . -a 'Sublime Text 2'"
alias app="open . -a Appcode"
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

rdbm () {
  if [ -f `pwd`/bin/rake ]
  then
    RAKE_CMD="./bin/rake"
  else
    RAKE_CMD="bundle exec rake"
  fi
  echo "Migrating dev database..."
  $RAKE_CMD db:migrate
  echo "Migrating test database..."
  $RAKE_CMD db:migrate RAILS_ENV=test
}

alias rdbr="bundle exec rake db:rollback && bundle exec rake db:rollback RAILS_ENV=test"

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
alias m="bundle exec middleman"
flix () {
  peerflix "`pbpaste`" --vlc -r
}

# Mongodb
alias mgo="/usr/local/opt/mongodb/bin/mongod --config /usr/local/etc/mongod.conf"

# SYSTEM
mcd () {
    mkdir -p "$@" && cd "$@"
}
alias mkc=mcd

alias t="tmux -2"
function tcwd () {
  tmux set-option default-path $PWD
}
alias tml="tmux list-sessions"
alias tma="tmux -2 attach -t $1"
alias tmk="tmux kill-session -t $1"
source $HOME/bin/tmuxinator.zsh

alias start='consular start'
alias edit='consular edit'
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers"
fs () {
  if test -f ./Procfile.dev
  then
    bundle exec foreman start -f Procfile.dev
  else
    bundle exec foreman start
  fi
}
alias dev="foreman start -f Procfile.dev"
alias gemspeed='bundle exec ruby -e "$(curl -fsSL https://gist.github.com/raw/2588879/benchmark.rb)" | sort -n -k4'
alias i="identify"
alias srv="http-server -p 3001"
# Handy Functions
c() { cd ~/Work/$1;  }

_c() { _files -W ~/Work -/; }
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

# restart postgres if crash
resetpg () {
  rm -f /usr/local/var/postgres/postmaster.pid
  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log -m immediate start
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

blamestats() {
    git ls-tree --name-only -z -r HEAD -- $1 | xargs -0 -n1 git blame --line-porcelain | grep "^author "|sort|uniq -c|sort -nr
}

# Mindster
mstage() {
  heroku $1 $2 --app mindster-staging
}

mprod() {
  heroku $1 $2 --app mindstertalent
}

# Syntax highlighting
hl () {
  filename=".tmp.highlight"
  lang=$1
  pbpaste > ${filename}
  highlight --syntax=${lang} --font=Mensch --font-size=30 --style=solarized-dark -O rtf < ${filename} | pbcopy
  rm -f ${filename}
}

eval $(thefuck --alias)

alias mdeploys="git push staging master"
alias mdeployp="git push heroku master"

# Git tab completion
# source ~/.git-completion.bash

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
# Change term for tmux
[ -n "$TMUX" ] && export TERM=screen-256color
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export WORDCHARS='*?[]~&;!$%^<>'
export ACK_COLOR_MATCH='red'
# Rails perf increase https://gist.github.com/1688857
# Older Ruby
#export RUBY_HEAP_MIN_SLOTS=1000000
# Newer Ruby
#export RUBY_GC_HEAP_INIT_SLOTS=1000000
#
#export RUBY_HEAP_SLOTS_INCREMENT=1000000
#export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
#export RUBY_GC_MALLOC_LIMIT=1000000000
#export RUBY_HEAP_FREE_MIN=500000

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

