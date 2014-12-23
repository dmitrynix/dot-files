#!/bin/bash

if [ "${1}" == "" ]
then
  ip="8.8.8.8"
else
  ip=${1}
fi

while :
do
  echo "# ping -c 4 ${ip}"
  ping -c 4 ${ip}

  echo "# sleep 5"
  sleep 5
done
