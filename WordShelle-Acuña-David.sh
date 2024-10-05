#!/bin/bash
# Tarea de Wordle en shell
# Pertenece a David Acuña López
# Nombre corto: Acuña-David
# Carne: 2020426228
# Fecha de entrega: 04/10/2024


#-----------------------MANUAL DE USAURIOS----------------------------------------------
# Para ejecutar el script se debe hacer uso de la terminal shell
# Si es en linux, la terminal por defecto
# En windows, se puede usar Git Bash o WSL

# -> OPCIONES DE EJECUCION <-
# OPCION 1 (SIN complicaciones):
# Abre el shell y navega hasta la carpeta donde se encuentra el script y BD.txt
# da permisos de ejecucion al script con el comando ->
#         chmod +x WordShelle-Acuña-David.sh
# Luego para ejecutar el script se debe hacer uso del comando ->
#         ./WordShelle-Acuña-David.sh [opción] [palabra en caso de -G]

# Ejemplo:
#         ./WordShelle-Acuña-David.sh -H
#         ./WordShelle-Acuña-David.sh -R
#         ./WordShelle-Acuña-David.sh -G perro

# OPCION 2:
# Mueve el script y BD.txt a una carpeta que ya esté en tu PATH
# puede ver tu PATH con el comando echo $PATH y mover los archivos ahí
# A continuación, da permisos de ejecución al script con el comando ->
#         chmod +x WordShelle-Acuña-David.sh
# Luego, puedes ejecutar el script desde cualquier lugar con el comando ->
#         WordShelle-Acuña-David.sh [opción] [palabra en caso de -G]

# Ejemplo:
#         WordShelle-Acuña-David.sh -H
#         WordShelle-Acuña-David.sh -R
#         WordShelle-Acuña-David.sh -G perro


# -------------------------------ANALISIS DE RESULTADOS-------------------------------------
# Worle shell -> A (COMPLETADO CON EXITO)
# En general, la tarea esta 100% funcionando. Se c cumple con los requerimientos solicitados por el profesor.


#================================================================================================
#=========================== FUNCIONES DEL SCRIPT ===============================================
#================================================================================================
# Mini acerca de Wordle
mini_acerca() {
    echo "El juego que juegas se llama wordle"
    echo "El juego consiste en jugar para adivinar una palabra :)"
    echo ""
    echo ""
}

#funcion que imprime la partida. Es decir, las palabras jugadas
imprimir_partida() {
    if [[ $(wc -l < wordle.txt) -lt 3 ]]; then  #NOTA: la verificacion esta de sobra pero la deje :)
        echo "No hay una partida completa para mostrar." 
    else
        tail -n +3 wordle.txt
    fi
}

# Funcion que selecciona una palabra(animal) aleatoria de BD.txt
seleccionar_palabra() {
    palabra=$(shuf -n 1 BD.txt)
    echo $palabra > wordle.txt # Guardar la palabra en wordle.txt con > (SOBREESCRIBE)
}

# Funcion que da inicio a la partida. Tambien reinicia el juego.
iniciar_partida() {
    seleccionar_palabra # Seleccionar una palabra aleatoria (llama a la funcion)
    echo "5" >> wordle.txt  # Se asigna el numero de intentos. el >> es para agregar al final del archivo (NO SOBREESCRIBE)
}

# Funcion de la logica del juego que verifica si la palabra ingresada es correcta
verificar_intento() {
    input_palabra=$1
    intento=$(sed -n "2p" wordle.txt)

    if (( intento == 0 )); then
        echo "Lamentablemente se vencieron tus intentos"
        echo "La palabra correcta era $(head -n 1 wordle.txt)"
        echo "-> Reinicie el juego con ./KunTse -R <-"
        exit 1
    else
        # Disminuir el número de intentos en el archivo wordle.txt
        intento=$((intento - 1))
        sed -i "2s/.*/$intento/" wordle.txt

        palabra_correcta=$(head -n 1 wordle.txt)
        lenPalabraCorrecta=${#palabra_correcta}
        lenInputPalabra=${#input_palabra}
        gano=$lenInputPalabra

        if (( lenPalabraCorrecta < lenInputPalabra )); then
            lenPalabraCorrecta=$lenInputPalabra
        fi

        linea1=""
        linea2=""
        linea3=""

        for (( i=0; i<$lenPalabraCorrecta; i++ )); do
            letra_palabra=${palabra_correcta:$i:1}
            
            # Verificar si input_palabra tiene un carácter en la posición actual
            if (( i < lenInputPalabra )); then
                letra_input=${input_palabra:$i:1}
            else
                letra_input="_"  # Si no, letra_input está vacío
            fi

            if [[ "$letra_palabra" == "$letra_input" ]]; then
                linea1+=" ╔═╗ "
                linea2+=" ║$letra_input║ "
                linea3+=" ╚═╝ "
                gano=$((gano - 1))
            elif [[ "$palabra_correcta" =~ "$letra_input" ]]; then
                linea1+=" ┌─┐ "
                linea2+=" │$letra_input│ "
                linea3+=" └─┘ "
            else
                # Comparar si letra_input está vacía
                if [[ "$letra_input" == "_" ]]; then
                    linea1+=" ┌─┐ "
                    linea2+=" │ │ "
                    linea3+=" └─┘ "
                else
                    linea1+="     "
                    linea2+="  $letra_input  "
                    linea3+="     "
                fi
            fi
        done
        
        # Añadir las líneas generadas al archivo
        echo "$linea1" >> wordle.txt
        echo "$linea2" >> wordle.txt
        echo "$linea3" >> wordle.txt

        # Si se adivina la palabra se muestra un mensaje de felicitaciones
        if (( gano == 0 )); then
            imprimir_partida
            echo "¡Felicidades! Has adivinado la palabra"
            exit 0
        else
            imprimir_partida
            echo "Intentos restantes: $(sed -n "2p" wordle.txt)"
        fi
    fi
}



# FUNCION PRINCIPAL - tiene un case para manejar las opciones, -H, -R, -G
# -H: Muestra la ayuda
# -R: Reinicia el juego
# -G: Intenta adivinar una palabra
# En la consola, se debe ejecutar el script con ./WordShelle-Acuña-David.sh [opción] [palabra en caso de -G]
main() {
    case $1 in
        -H)
            mini_acerca
            echo "Uso: KunTse [-R] [-G palabra]"
            echo "-R: Reiniciar el juego"
            echo "-G: Intentar adivinar una palabra"
            ;;
        -R)
            mini_acerca
            echo "====================================="
            echo "El juego ha sido reiniciado, tienes 5 intentos"
            iniciar_partida
            ;;
        -G)
            mini_acerca
            #primero verificamoss si el archivo wordle.txt existe
            if [[ ! -f wordle.txt ]]; then
                iniciar_partida
            fi
            
            if [[ -z $2 ]]; then # El -z verifica si ingresamos una palabra
                echo "Debe proporcionar una palabra"
                exit 1
            fi
            verificar_intento $2
            ;;
        *)
            mini_acerca
            echo "Opción NO valida. Use -H para ayuda"
            ;;
    esac
}

main "$@"