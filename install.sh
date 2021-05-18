#!/bin/bash

cp -rf .vim/ ~/.vim
cp -f .vimrc ~/.vimrc
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim
vim +PluginInstall +qall

