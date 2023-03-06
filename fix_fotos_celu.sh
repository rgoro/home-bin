#!/bin/sh


for i in *.jpg; do
	touch -amt $(echo $i | sed "s/^20//" | sed "s/\.jpg$//" | sed "s/_//" | perl -pe "s/([0-9][0-9])$/\.\1/") $i;
done

