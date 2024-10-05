# !/bin/bash
# Autor: David Acuna Lopez
# Nombre corto: Acuña-David
# Carne: 2020426228
#

# Ejemplos de variables y parametros dinamicos


nombre=$1
apellido=$2
ubicacion=$(pwd)

echo "El nombre es: $nombre $apellido" 
echo "La cantidad de parametros es: $#"

echo "La ubicacion actual es: $ubicacion"

