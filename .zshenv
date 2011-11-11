fpath=($fpath $HOME/.zsh/func)
typeset -U fpath
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
