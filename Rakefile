desc "Create symlinks"
task :default do
  require 'fileutils'
  HOME = ENV['HOME'] || "~"
  %w[.ackrc .config/ .gemrc .gitconfig .tmux.conf .vim/ .vimrc .zsh/ .zshenv .zshrc].each do |file|
    Fileutils.ln_s(File.join(Dir.pwd, file), File.join(HOME, file))
  end
end
