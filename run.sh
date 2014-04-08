#!/bin/bash

set -e

script_path=$(readlink -f "$0")
directory_path=$(dirname "${script_path}")

for file in ${directory_path}/dot/*
do
  file_basename=$(basename $file)

  echo " + ~/.${file_basename}"

  rm -fr ${HOME}/.${file_basename} && ln -s ${file} ${HOME}/.${file_basename}
done
