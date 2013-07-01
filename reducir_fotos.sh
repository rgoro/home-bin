#!/bin/bash

while [ $# -ne 0 ]; do
	echo $1
	if [ -e "$1" ]; then
		convert $1 -verbose -resize 40% menor_$1
	else
		echo "$1 no existe"
	fi
	shift
done

