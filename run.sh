#!/bin/bash

set -e

script_path=$(readlink -f "$0")
directory_path=$(dirname "${script_path}")

if [ ! -x "$(which git)" ]; then
  echo "ERROR: git not installed"
  exit 1
fi

prezto_path="${HOME}/.zprezto"
echo " + ${prezto_path}"
if [ -d "${prezto_path}" ]; then
  cd ${prezto_path}
  git pull --rebase origin master
  git submodule update --init --recursive
else
  git clone --recursive \
    https://github.com/sorin-ionescu/prezto.git ${prezto_path}
  rm -fr ~/.zprofile
  ln -s ${HOME}/.zprezto/runcoms/zprofile ~/.zprofile
fi

for file in ${directory_path}/dot/*
do
  file_basename=$(basename $file)

  echo " + ~/.${file_basename}"

  rm -fr ${HOME}/.${file_basename} && ln -s ${file} ${HOME}/.${file_basename}
done
