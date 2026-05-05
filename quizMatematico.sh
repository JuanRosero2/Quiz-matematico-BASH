#!/bin/bash

# --- Funcion validacion de la respuesta ---

function validar_resp
{
    typeset -i num_a=$1
    typeset -i num_b=$2
    typeset oper=$3
    typeset -i correcto=$4
    typeset -i i=1
    typeset -i resp

    while (( i <= 3 ))
    do
        echo -n "¿Cuanto es $num_a $oper $num_b? "
        read resp
        
        if (( resp == correcto ))
        then
            echo "Respuesta correcta"
            echo "¡Bien hecho!"
            return 0
        else
            if (( i < 3 ))
            then
                echo "Respuesta incorrecta. Intentalo de nuevo."
            fi
        fi
        (( i = i + 1 ))
    done

    echo "Agotaste los intentos. La respuesta era: $correcto"
}

# --- Menú principal ---

typeset -i opcion=0
typeset -i A
typeset -i B
typeset -i resultado

while (( opcion != 0 ))
do
    echo " "
    echo "QUIZ MATEMATICO"
    echo "1) Suma"
    echo "2) Resta"
    echo "3) Multiplicacion"
    echo "4) Division"
    echo "0) Salir"
    echo -n "Elige una opcion: "
    read opcion

    case $opcion in
        1)
            A=$(( RANDOM % 101 ))
            B=$(( RANDOM % 101 ))
            resultado=$(( A + B ))
            validar_resp $A $B "+" $resultado
            ;;
        2)
            A=$(( RANDOM % 101 ))
            B=$(( RANDOM % 101 ))
            if (( A < B ))
            then
                typeset -i temp=$A
                A=$B
                B=$temp
            fi
            resultado=$(( A - B ))
            validar_resp $A $B "-" $resultado
            ;;
        3)
            A=$(( (RANDOM % 100) + 1 ))
            B=$(( (RANDOM % 10) + 1 ))
            resultado=$(( A * B ))
            validar_resp $A $B "*" $resultado
            ;;
        4)
            A=$(( (RANDOM % 20) + 1 ))
            B=$(( (RANDOM % 10) + 1 ))
            A=$(( A * B ))
            resultado=$(( A / B ))
            validar_resp $A $B "/" $resultado
            ;;
        0)
            echo "Adios."
            ;;
        *)
            echo "Opcion invalida."
            ;;
    esac
done