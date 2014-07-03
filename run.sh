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
  source $script
done

for file in ${directory_path}/dot/*
do
  file_basename=$(basename $file)

  echo " + ~/.${file_basename}"

  rm -fr ${HOME}/.${file_basename} && ln -s ${file} ${HOME}/.${file_basename}
done

rm -fr ~/.config/systemd/user
mkdir -p ~/.config/systemd
ln -s ${directory_path}/config-systemd-user ~/.config/systemd/user
