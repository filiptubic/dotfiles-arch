#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo ""
else
  connected=$(python $HOME/.config/polybar/bluetooth/script.py)
  if [ -z "${connected}" ];
  then
    echo ""
  fi
  echo " %{T1}$connected%{T-}"
fi
