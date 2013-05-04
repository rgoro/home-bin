#!/bin/bash

if [ -e "$1" ]; then
	cat "$1" | xargs -I FOTO convert FOTO -verbose -resize 40% menor_FOTO
else
	echo "$1 no existe"
fi

