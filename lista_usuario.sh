#!/bin/bash

#!/usr/bin/env bash

#

# lista_usuario.sh - Extrai usuarios do /etc/passwd 

#

# Site:       https://github.com/JhonatanRian

# Autor:      Jhonatan Rian

# ------------------------------------------------------------------------ #

#  Extrai nomes do usuario com possibilidade de colocar em maiusculo
#  Ou em ordem alfabetica

#  Exemplos:

#      $ lista_usuario.sh -s -m

#      Neste exemplo o script será executado no modo debug nível 1

# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM="
    $0 - [OPÇÕES]

    -h - menu de ajuda
    -v - versão
    -s - ordenar a saida
"
VERSAO="1.2"
# ------------------------------- EXECUÇÃO ----------------------------------------- #
while test -n "$1"
do
    case "$1" in
        -h) echo "$MENSAGEM" && exit 0                   ;;
        -v) echo "$VERSAO" && exit                       ;;
        -s) chave_o=1                                    ;;
        -m) chave_m=1                                    ;;
         *) echo "Opção inválida, valide o -h" && exit 1 ;;
    esac
    shift
done
[ $chave_o -eq 1 ] && USUARIOS=$(echo "$USUARIOS" | sort)
[ $chave_m -eq 1 ] && USUARIOS=$(echo "$USUARIOS" | tr [a-z] [A-Z])

echo "$USUARIOS"

# ------------------------------------------------------------------------ #
