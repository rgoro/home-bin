#!/bin/bash

if [ -e "$i" ]; then
	cat fotos.txt | xargs -I FOTO convert FOTO -verbose -resize 40% menor_FOTO
else
	echo "$1 no existe"
fi

