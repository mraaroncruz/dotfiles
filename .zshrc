setopt promptsubst
autoload -U promptinit
promptinit
prompt grb
setopt AUTO_MENU
autoload -Uz compinit
compinit
zstyle ':completion:*' special-dirs true

export ANDROID_HOME="/Developer/SDKs/Android2.2/tools"
export PATH=/Users/aaron/.gem/ruby/1.8/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin/:/Library/PostgreSQL/8.4/bin:$ANDROID_HOME:$PATH:
export JSTESTDRIVER_HOME=~/.JsTestDriver/
export COUCH="http://127.0.0.1:5984"
# export ANT_HOME="/usr/bin"
# export JAVA_HOME="/usr/bin"
## aliases to make my life easier
alias spk="bundle exec spork cucumber & bundle exec spork"
alias iphone="open /Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"
alias sstr="sudo apachectl start"
alias sstp="sudo apachectl stop"
alias srt="sudo apachectl restart"
alias nstart="sudo nginx"
alias nstop="sudo nginx -s stop"
alias nreload="sudo nginx -s reload"
# alias cassandra="/usr/local/src/apache-cassandra-0.6.3/bin/cassandra-cli --host localhost --port 9160"
alias nstat="sudo lsof -i -P"
alias p="padrino"

function github {
  open "https://github.com/search?q=$1&type=Everything&repo=&langOverride=&start_value=1"
}
function geo {
  geocode $1 | grep L
}

alias t="terminitor"
alias phpdoc="thor php:open"

alias powstop="curl get.pow.cx/uninstall.sh | sh"
alias powstart="curl get.pow.cx | sh"

alias g="git"
alias ports="sudo lsof -i -P"
export EDITOR="mvim"
## terminal color fun
export CLICOLOR=1
#export LSCOLORS=caFxCxDxBxegedabagacad
alias ls='ls -GF'
alias ll='ls -h1'
alias lt='ls -lTsSa'
alias lll='ls'
alias lsl="ls -lG"
alias lsla="ls -laG"
alias shortcuts="bind -P | less"

alias nodedoc="open /usr/local/src/nodejs_all/node-v0.3.0/doc/api.html"

alias sb="staticmatic build ."
alias sp="staticmatic preview ."

alias v.="vim ."
alias m="mate"
alias m.="mvim ."
alias s.="open -a 'Sublime Text 2' ."
alias s="open -a 'Sublime Text 2'"
# Git tab completion
# source ~/.git-completion.bash
# Add paths that should have been there by default
export PATH=/usr/local/sbin:/usr/local/bin:${PATH}
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:~/.gem/ruby/1.8/bin"

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -lG'
alias duh='du -csh'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
alias b="bundle"
alias bi="bundle install --binstubs --path vendor/bundle --without production"
alias bu="bundle update"
alias bc="bundle check"
alias be="bundle exec"

alias migrate="bundle exec rake db:migrate"
alias deploy="bundle exec rake vlad:deploy"
alias easy_deploy="bundle exec rake vlad:easy_deploy"

alias nstart="sudo nginx"
alias nreload="sudo nginx -s reload"

# Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export WORDCHARS='*?[]~&;!$%^<>'

export ACK_COLOR_MATCH='red'

# ACTUAL CUSTOMIZATION OH NOES!
gd() { git diff $* | view -; }
gdc() { gd --cached $*; }
alias rbgrep="grep --include='*.rb' $*"
alias r=rails
alias t="script/test $*"
alias sr="screen -r"
alias gx="gitx"
alias gxa="gitx --all"
alias :q="echo YOU FAIL"
function cdf() { cd *$1*/ } # stolen from @topfunky
# Originally from Jonathan Penn, with modifications by Gary Bernhardt
function whodoneit() {
    (set -e &&
        for x in $(git grep -I --name-only $1); do
            git blame -f -- $x | grep $1;
        done
    )
}
# So gcc works correctly... I hope they fix this
#CC=/usr/bin/gcc-4.2

alias rr='rbenv rehash'
bindkey "^[[3~" delete-char
alias start='consular start'
alias edit='consular edit'
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers"
