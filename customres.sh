#!/bin/bash

WIDTH=$1
HEIGHT=$2
HZ=$3

DNAME=$(xrandr --listmonitors | sed -ne 's/ .* //gp') # Actual Monitor

MODELINE=$(cvt $WIDTH $HEIGHT $HZ | grep 'Modeline')
MODE_NEW=$(echo $MODELINE | awk -F " " '{print $2; exit}')

xrandr --newmode $(echo $MODELINE| awk -F " " '{print $2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "$10" "$11" "$12" "$13; exit}')
xrandr --addmode $DNAME $MODE_NEW 

