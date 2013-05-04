#!/bin/bash

if [ -e "$i" ]; then
	cat "$i" | xargs -I FOTO convert FOTO -verbose -resize 40% menor_FOTO
else
	echo "$1 no existe"
fi

