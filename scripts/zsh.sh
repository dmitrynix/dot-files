#!/bin/bash

for plugin in zsh-syntax-highlighting zsh-history-substring-search
do
  if [ -d "${HOME}/.${plugin}" ]; then
    cd ~/.${plugin} && git pull origin master
  else
    git clone https://github.com/zsh-users/${plugin}.git \
      ~/.${plugin}
  fi
done
