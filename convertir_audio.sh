#!/bin/bash

#levanto parametros
TEMP=`getopt -o hf:b: -n $0 -- "$@"`

eval set -- "$TEMP"

FORMAT=flac
BITRATE=128

while true; do
	case "$1" in
		-h) echo "Uso: $0 [-h | -f <ogg|wma|wav|m4a|flac> -b <bitrate>]"
			echo "Convierte todos los archivos del directorio"
			exit 0
			;;
		-f) FORMAT="$2"
			shift 2
			;;
		-b) BITRATE="$2"
			shift 2
			;;
		--) shift ; break ;;
#		-*|*) 
#			echo "fruta en los parámetros"
#			echo "Uso: $0 [-h | -f <ogg|wma|wav> -b <bitrate>]"
#			exit 1
#			;;
	esac
done
		
echo "Formato: $FORMAT"
echo "Bitrate: $BITRATE (ignorado si el formato es flac)"

case "$FORMAT" in
	ogg)
		for i in *.ogg; do
			j=${i%.ogg}.mp3
			sox "$i" -t .wav - | lame -b $BITRATE - "$j"
		done
		;;
	wma)
		for i in *.wma; do
			j=${i%.wma}.wav
			k=${i%.wma}.mp3
			mplayer -ao pcm:fast:file="$j" "$i"
			lame -b $BITRATE "$j" "$k"
			rm "$j"
		done
		;;
	m4a)
		for i in *.m4a; do
			j=${i%.m4a}.wav
			k=${i%.m4a}.mp3
			mplayer -ao pcm:fast:file="$j" "$i"
			lame -b $BITRATE "$j" "$k"
			rm "$j"
		done
		;;
	wav)
		for i in *.wav; do
			j=${i%.wav}.mp3
			lame -b $BITRATE "$i" "$j";
		done
		;;
	flac)
		for i in *.flac; do
			j=${i%.flac}.mp3
			sox "$i" -t .wav - | lame -b 320 - "$j";
		done
		;;
esac
	
