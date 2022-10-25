#!/bin/bash

home=/home/$USER

cp ./files/.vimrc $home/.vimrc
mkdir $home/.vim
mkdir $home/.vim/autoload $home/.vim/backup $home/.vim/colors $home/.vim/plugged
vim +PlugInstall +qall
