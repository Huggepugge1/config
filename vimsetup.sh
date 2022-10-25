#!/bin/bash

home=/home/$USER

# Make files
cp ./files/.vimrc $home/.vimrc
mkdir $home/.vim
mkdir $home/.vim/autoload $home/.vim/backup $home/.vim/colors $home/.vim/plugged

# Get plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
vim +PlugInstall +qall
