#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo ""
else
  connected=$(bluetoothctl devices | cut -f2 -d' ' | while read uuid; do bluetoothctl info $uuid; done | grep -e "Name\|Connected: yes" | grep -B1 "yes" | head -n 1 | cut -d\  -f2-)
  
  if [ -z "${connected}" ];
  then
    echo ""
  fi
  echo " %{T1}$connected%{T-}"
fi
