fpath=($fpath $HOME/.zsh/func)
typeset -U fpath

if [ -d "$HOME/.rbenv" ]; then
  export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi
