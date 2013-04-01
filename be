#!/bin/sh
# 

uso='be: Busca y Edita.  Busca un pedazo de texto, y si la encuentra abre
 el gvim en esa línea.

OJO!! PUEDE DAR CUALQUIER COSA SI EL PATRON NO EXISTE!!!!

USO: be [parámetros para grep]'

uso () {
echo $uso
exit 1
}

[ $# -gt 0 ] || uso 

#[ $(grep -n $*) != '' ] || (echo 'Patrón no encontrado' && exit 1)
echo $*

grep -n $* | awk '{print $1}' |sed 's/:/ +/; s/://' |xargs gvi
