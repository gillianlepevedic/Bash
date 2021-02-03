#!/bin/bash
if test $# -eq 0
    then
    echo "il faudrait fournir le nom du fichier en paramètres"
    exit 1
fi

if test  ! -f "${1}"
    then
    echo "${1}"" n'est pas un fichier"
    exit 2
fi

if test ! -d ~/corbeille
    then
    mkdir ~/corbeille
    echo "Le dossier corbeille a été crée"
fi

if test   -f ~/corbeille/"${1}"
then
    nv="1"
    while test -f ~/corbeille/"${1}(${nv})"
        do
        nv=$((${nv}+1))
    done
    mv ./"${1}" ~/corbeille/"${1}(${nv})"
else
    mv ./"${1}" ~/corbeille/"${1}"
fi

if test  -f "${1}"
    then
    echo "${1} n'a pas été suprimmer dans la corbeille"
    exit 3
else
    echo "${1} fichier a été déplacé dans la corbeille"

    exit 0
fi