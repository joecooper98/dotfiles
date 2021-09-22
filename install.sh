#!/bin/bash

cp -rf .vim/ ~/.vim
cp -f .vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
vim +PluginClean +PluginInstall +CocInstall coc-json +qall
mkdir ~/.vim/UltiSnips
cp tex.snippets ~/.vim/UltiSnips/tex.snippets

