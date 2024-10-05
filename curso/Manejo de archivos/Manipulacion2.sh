#!/bin/bash
# Autor: David Acuna Lopez
# Nombre corto: Acuña-David
# Carne: 2020426228

input_name=$1
echo "=========LECTURA DE ARCHIVO========="
echo $input_name
echo "=========LECTURA DE ARCHIVO, linea a linea========="
echo "IFS (Internal Field Separator), leer linea a linea"

while IFS= read line
do
    echo "$line"
done < $input_name