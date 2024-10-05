# !/bin/bash
# Autor: David Acuna Lopez
# Nombre corto: Acuña-David
# Carne: 2020426228
#

# Algunas variables
hola="Hola Mundo"
num1=10
num2=5

echo $hola
echo "====================="

echo "$num1 + $num2 = " $((num1 + num2))

echo "====================="
echo "Operadores Aritmeticos"

echo "$num1 < $num2 = " $((num1 < num2))
echo "$num1 > $num2 = " $((num1 > num2))
echo "$num1 <= $num2 = " $((num1 <= num2))
echo "$num1 >= $num2 = " $((num1 >= num2))
echo "$num1 == $num2 = " $((num1 == num2))
echo "$num1 != $num2 = " $((num1 != num2))

echo " ╔═╗╔═╗┌─┐┌─┐┌─┐┌─┐"
echo " ║a║║n║│a││n││a││ │"
echo " ╚═╝╚═╝└─┘└─┘└─┘└─┘"