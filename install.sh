#!/bin/bash

set -e

script_path=$(readlink -f "$0")
directory_path=$(dirname "${script_path}")

function sync_dotfile() {
  echo " + ~/.${1}"

  rm -fr ${HOME}/.${1} && ln -s ${directory_path}/${1} ${HOME}/.${1}
}

sync_dotfile tmux.conf
sync_dotfile gemrc
