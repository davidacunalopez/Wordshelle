#!/bin/bash
# Autor: David Acuna Lopez
# Nombre corto: Acuña-David
# Carne: 2020426228

input_type=""
input_name=""
input_content=""

read -p "Desea generar un directorio(1) o un archivo(2): " input_type

if (( $input_type == 1 )); then
    read -p "Ingrese el nombre del directorio: " input_name
    mkdir $input_name
    echo "Directorio creado"
elif (( $input_type == 2 )); then
    read -p "Ingrese el nombre del archivo: " input_name
    touch $input_name
    read -p "Ingrese el contenido del archivo: " input_content
    echo $input_content >> $input_name
    echo "Archivo creado"
else
    echo "Opcion invalida"
fi