#!/bin/bash

if [ "${1}" == "" ]
then
  ip="8.8.8.8"
else
  ip=${1}
fi

set -x

while :
do
  ping -c 10 ${ip}
  sleep 5
done
