#!/bin/bash

set -x
#set -e

while :
do
  ping -c 4 8.8.8.8
  sleep 5
done
