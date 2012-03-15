# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="grb"
ZSH_THEME="terminalparty"
#ZSH_THEME="dogenpunk"
#ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(osx bundler brew rails3 heroku pow sprunge pferdefleisch)
plugins=(osx brew rails3 pow sprunge pferdefleisch)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
export PATH=/Users/aaron/bin:/usr/local/sbin:/usr/local/bin:/Users/aaron/.gem/ruby/1.8/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin/:/Library/PostgreSQL/8.4/bin:/Developer/SDKs/Android2.2/tools:/Users/aaron/.rbenv/shims:/Users/aaron/.rbenv/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin::~/.gem/ruby/1.8/bin
