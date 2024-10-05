#!/bin/bash
# Autor: David Acuna Lopez
# Nombre corto: Acuña-David
# Carne: 2020426228


numeros=(1 2 3 4 5 6 7 8 9 10)
nombres=("David" "Juan" "Pedro" "Maria" "Jose")
rangos=({A..Z} {20..30})

echo "Imprimir todos los valores"
echo "${numeros[*]}"
echo "${nombres[*]}"
echo "${rangos[*]}"

echo "Imprimir un elemento del arreglo"
echo "${numeros[0]}"
echo "${nombres[1]}"
echo "${rangos[2]}"

echo "Manipular los valores del arreglo"
numeros[0]=100
nombres[1]="Carlos"
unset numeros[1]
echo "${numeros[*]}"
echo "${nombres[*]}"
echo "${rangos[*]}"


echo "Iteracion for" 

for num in ${numeros[*]}
do
    echo "Numero: $num"
done

#otro tipo de for
echo "Iteracion for con indices"
echo "========================="

for ((i=0; i<${#nombres[*]}; i++))
do
    echo "Nombre: ${nombres[$i]}"
done