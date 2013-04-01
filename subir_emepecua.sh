#!/bin/bash

EMEPECUA="/media/rgoro/0000-006F"
EMEPECUA_SED="\/media\/rgoro\/0000-006F"

PWD=$(pwd)

case $PWD in 
	'/home/rgoro/musica/'*)
		DST=$(echo $PWD | sed "s/\/home\/rgoro\/musica/$EMEPECUA_SED/")
		;;
	'/home/rgoro/Desktop/musica/'*)
		DST=$(echo $PWD | sed
		"s/\/home\/rgoro\/Desktop\/musica/$EMEPECUA_SED/")
		;;
	'/mnt/data/musica/'*)
		DST=$(echo $PWD | sed "s/\/mnt\/data\/musica/$EMEPECUA_SED/")
		;;
	*)
		echo "No se copiar cosas desde $PWD"
		exit
		;;
esac

case $DST in
	$EMEPECHA/*/*)
		;;
	$EMEPECUA/*)
		echo "Estamos parados en una categoría, no un disco."
		exit
		;;
esac

echo $DST

crear_dir() {
	mkdir "$1" 2>/dev/null

	if [ $? = 1 ]; then
		DIR_ANTERIOR=$(echo "$1" | sed 's/\/[^/]*$//')

		crear_dir "$DIR_ANTERIOR"

		mkdir "$1" 2>/dev/null
	fi
}

if [ ! -d "$DST" ]; then
	crear_dir "$DST"
fi

BORRAR_MP3=0

ls *.mp3 > /dev/null 2>/dev/null;

if [ $? -ne 0 ]; then
	# Asumo que lo que hay es flac.
	convertir_audio.sh -f flac
	BORRAR_MP3=1
fi

for i in *.mp3; do
	cp "$i" "$DST"
done

if [ $BORRAR_MP3 -eq 1 ]; then
	rm *.mp3
fi
