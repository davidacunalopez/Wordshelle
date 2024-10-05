#!/bin/bash
# Autor: David Acuna Lopez
# Nombre corto: Acuña-David
# Carne: 2020426228
#

#condicionales
#OPERADORES RELACIONALES
# -eq igual
# -ne diferente
# -gt mayor que
# -lt menor que
# -ge mayor o igual que
# -le menor o igual que


name=""
age=0
year=0

read -p "Ingrese su nombre: " name
read -p "Ingrese su edad: " age
read -p "Ingrese el año actual: " year

echo "====================="

if (( $age >= 18 )); then
    echo "Eres mayor de edad"
else
    echo "Eres menor de edad"
fi  #end if

echo "====================="
if [ $age -ge 18 ] && [ $year -eq 2021 ]; then
    echo "Eres mayor de edad y estamos en el 2021"
else
    echo "No cumples con las condiciones"
fi  #end if