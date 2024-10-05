#!/bin/bash
# Autor: David Acuna Lopez
# Nombre corto: Acuña-David
# Carne: 2020426228
#

opcion=""
read -p "Ingrese una opcion: " opcion

case $opcion in
    "1")
        echo "Opcion 1"
        ;;
    "2")
        echo "Opcion 2"
        ;;
    "3")
        echo "Opcion 3"
        ;;
    *)
        echo "Opcion invalida"
        ;;
esac  #end case