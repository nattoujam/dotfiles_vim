#!/bin/sh
unlink ~/.vimrc
unlink ~/.config/vim

path=`pwd`

echo "link $path/.vimrc to home directory"
ln -s $path/.vimrc ~/

echo "link $path/.config/vim to home directory"
ln -s $path/.config/vim ~/.config/
