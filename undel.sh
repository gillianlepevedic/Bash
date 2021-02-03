#!/bin/bash
if test $# -eq 0
    then
    echo "il faudrait fournir le nom du fichier en paramètres"
    exit 1
fi

if test  ! -f ~/corbeille/"${1}"
    then
    echo "Le fichier ${1} n'existe pas dans corbeille"
    exit 2
else
    nv=$(ls ~/corbeille/${1}* | wc -l)
    nv=$((${nv}-1))
    echo "$nv"
    if test $nv -eq 0
    then
        cp ~/corbeille/"${1}" ./"${1}.hold"
    else 
        cp ~/corbeille/"${1}(${nv})" ./"${1}.hold"
    fi 
fi



if test -f "${1}.hold"
    then 
    echo "Fichier restaurer"
    exit 0
else
    echo "Fichier impossible à restaurer"
    exit 3
fi