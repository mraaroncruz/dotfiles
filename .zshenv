fpath=($fpath $HOME/.zsh/func)
typeset -U fpath
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
