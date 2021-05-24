# !/bin/zsh
CONFIG_DIRS=(alacritty bspwm conky dunst picom polybar safeeyes sxhkd )
BU_DIR=$HOME/github/chatziiola

for i in $CONFIG_DIRS;
do
	cp -rf $XDG_CONFIG_HOME/$i $BU_DIR
done

cp -rf $HOME/.vim/vimrc $BU_DIR/vim/vimrc
