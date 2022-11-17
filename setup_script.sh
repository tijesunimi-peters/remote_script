#!/bin/sh
#

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tijesunimi-peters/vim_conf.git 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s $HOME/vim_conf/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/vim_conf/.vimrc $HOME/.vimrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

rm -rf $HOME/.zshrc && ln -s $HOME/vim_conf/.zshrc $HOME/.zshrc

mkdir -p $HOME/.vim/files/backup $HOME/.vim/files/swap $HOME/.vim/files/info

vim +PluginInstall +qall

touch $HOME/.vim_conf.completed

