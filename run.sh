#!/bin/bash

set -e

script_path=$(readlink -f "$0")
directory_path=$(dirname "${script_path}")

if [ ! -x "$(which git)" ]; then
  echo "ERROR: git not installed"
  exit 1
fi

for script in ${directory_path}/scripts/*
do
  echo " + $(basename $script)"
  source $script
done

for file in ${directory_path}/dot/*
do
  file_basename=$(basename $file)

  if [ -n "${SSH_CONNECTION}" ] && [ ${file_basename} = "tmux.conf" ]
  then
    echo " + ~/.${file_basename} not copied"
  else
    echo " + ~/.${file_basename}"
    rm -fr ${HOME}/.${file_basename} && ln -s ${file} ${HOME}/.${file_basename}
  fi
done


# Tip from: https://github.com/neovim/neovim/blob/42047acb4f07c689936b051864c6b4448b1b6aa1/runtime/doc/nvim_from_vim.txt#L12-L18
set -xe
nvim_config=${XDG_CONFIG_HOME:=$HOME/.config}/nvim
\rm -rf ${nvim_config}/init.vim
\rm -rf ${nvim_config}
ln -s ~/.vim ${nvim_config}
ln -s ${directory_path}/dot/vimrc ${nvim_config}/init.vim
