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
VERSAO="1.1"

# ------------------------------------------------------------------------ #


# ------------------------------- TESTES ----------------------------------------- #
# ------------------------------- EXECUÇÃO ----------------------------------------- #
#if [ "$1" = "-h" ]; then
#    echo "$MENSAGEM" && exit 0
#elif [ "$1" = "-v" ]; then
#    echo "$VERSAO" && exit
#elif [ "$1" = "-s" ]; then
#    echo "$USUARIOS" | sort && exit
#else
#    echo ""
#fi

case "$1" in
    -h) echo "$MENSAGEM" && exit 0      ;;
    -v) echo "$VERSAO" && exit          ;;
    -s) echo "$USUARIOS" | sort && exit ;;
     *) echo "$USUARIOS"                ;;
esac

# ------------------------------------------------------------------------ #
