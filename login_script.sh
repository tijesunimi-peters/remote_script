#!/bin/sh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  usermod -s /bin/bash admin
else
  usermod -s /bin/zsh admin
fi


if [ ! -d "$HOME/.remote_script.loaded" ]; then
  git clone https://github.com/tijesunimi-peters/remote_script.git && touch $HOME/.remote_script.loaded
fi

if [ ! -f "$HOME/.vim_conf.completed" ]; then
  $HOME/remote_script/setup_script.sh 
fi
 
tmux has-session -t $USER 2>/dev/null

if [ $? != 0 ]; then
  tmux new -t $USER
else
  tmux attach-session -t $USER
fi
