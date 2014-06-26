set PATH /usr/bin
set PATH /bin $PATH
set PATH /usr/sbin $PATH
set PATH /sbin $PATH
set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH
set PATH $HOME/bin $PATH

set -xg GOPATH $HOME/go
set -xg PATH $GOPATH/bin $PATH

set fish_git_dirty_color red
set fish_git_not_dirty_color magenta

. $HOME/.config/fish/prompt.fish
