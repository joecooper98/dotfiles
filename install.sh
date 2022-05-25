#!/bin/bash

cp -rf .vim/ ~/.vim
cp -f .vimrc ~/.vimrc
sed -i "s/smokey/$(whoami)/" .zshrc
cp -f .zshrc ~/.zshrc
git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
vim +PluginClean +PluginInstall +CocInstall coc-json +qall
if [ ! -e ~/.vim/UltiSnips/ ]
then
mkdir ~/.vim/UltiSnips
fi

cp tex.snippets ~/.vim/UltiSnips/tex.snippets
