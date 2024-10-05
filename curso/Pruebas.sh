# !/bin/bash
# Autor: David Acuna Lopez
# Nombre corto: Acuña-David
# Carne: 2020426228
#

num_input=0


numerotxt=$(sed -n "2p" pdatos.txt)

if (( numerotxt < 5 )); then
    read -p "Ingrese un numero: " num_input
    sed -i "2s/.*/$num_input/" pdatos.txt
else
    numx=$((numerotxt - 1))
    sed -i "2s/.*/$numx/" pdatos.txt
    palabra=$(sed -n "1p" pdatos.txt)
    echo "La palabra es: $palabra"
    if (( palabra == "hola" )); then
        #Me devuelve la segunda letra de la palabra
        echo "La segunda letra de la palabra es: ${palabra:1:1}"
        echo "${palabra:1:1}" 
        echo palabra[1]
    else
        echo "La palabra es incorrecta"
    fi
fi
    