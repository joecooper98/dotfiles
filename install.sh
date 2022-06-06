#!/bin/bash

echo 'Copying files to home directory'
cp -rf .vim/ ~/.vim
cp -f .vimrc ~/.vimrc
sed -i "s/smokey/$(whoami)/" .zshrc
cp -f .zshrc ~/.zshrc

cwd=`pwd`

if [ -e ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin ]
then
  echo 'fzf-zsh-plugin already exists, attempting to update...'
  cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
  git pull
  cd $cwd
else
  echo "fzf-zsh-plugin doesn't exist, attempting to install via git"
  git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
fi

if [ -e ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]
then
  echo 'zsh-autosuggestions already exists, attempting to update...'
  cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git pull
  cd $cwd
else
  echo "zsh-autosuggestions doesn't exist, attempting to install via git"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ -e ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]
then
  echo 'zsh-syntax-highlighting already exists, attempting to update...'
  cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git pull
  cd $cwd
else
  echo "zsh-syntax-highlighting doesn't exist, attempting to install via git"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [ -e ~/.vim/bundle/Vundle.vim ]
then 
  echo 'Vundle.vim already exists, attempting to update...'
  cd ~/.vim/bundle/Vundle.vim
  git pull
  cd $cwd
else
  echo "Vundle.vim doesn't exist, attempting to install via git"
  git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
fi

echo 'Installing plugins in vim...'
cp coc-settings.json ~/.vim/
vim +PluginClean +PluginInstall +CocInstall coc-json +CocInstall @yaegassy/coc-pylsp +qall

echo 'Done!'
#if [ ! -e ~/.vim/UltiSnips/ ]
#then
#mkdir ~/.vim/UltiSnips
#fi
#
#cp tex.snippets ~/.vim/UltiSnips/tex.snippets
