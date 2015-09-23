#!/bin/bash

if [ $# -lt 2 ]; then
	echo "USO: $0 inicio fin"
	exit 1
fi

START=$1
END=$2

FILES=""

for i in $(seq $START $END); do
	FILES="$FILES IMG_$i.JPG"
done

hugin $FILES
