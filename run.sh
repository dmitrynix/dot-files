#!/bin/bash

set -e

script_path=$(readlink -f "$0")
directory_path=$(dirname "${script_path}")

cd $directory_path

if [ ! -x "$(which git)" ]; then
  echo "ERROR: git not installed"
  exit 1
fi

git submodule init
git submodule update

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

config_dir=${XDG_CONFIG_HOME:=$HOME/.config}
mkdir -p ${config_dir}
\rm -fr ${config_dir}/nvim
ln -s ${directory_path}/nvim ${config_dir}/nvim
echo " + vim bundle"

if [ -x "$(which git)" ]
then
  nvim +BundleInstall +qall
  nvim +BundleUpdate +qall
fi

echo " + zsh"
for plugin in zsh-syntax-highlighting zsh-history-substring-search
do
  if [ -d "${HOME}/.${plugin}" ]; then
    cd ~/.${plugin} && git pull origin master
  else
    git clone https://github.com/zsh-users/${plugin}.git ~/.${plugin}
  fi
done
