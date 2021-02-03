if  test ! "$1"
then
    echo "Il faut minimum 1 parametres. Un nombres positif";
    exit 1;
fi

billet=(500 200 100 50 20 10 5 2 1);
client=1;

while test $# -gt 0
do
    if  ! [[ "$1" =~ ^[0-9]+$ ]]
    then
        echo "Client n°${client}: n'a pa peut etres servi (${1} n'est pas un nombres)";
        client=$((client+1));
        shift;
        continue;
    fi

    if test "${1}" -ge 0
    then
        echo "Client n°${client} demande ${1}€";
        else
        echo "Client n°${client}: n'a pa peut etres servi (${1} n'est pas un nombres positif)";
        client=$((client+1));
        shift;
        continue;
    fi

    monnaie=(0 0 0 0 0 0 0 0 0);
    reste=$1;
    indice=0;

    while test $reste -gt 0
    do
        while test $reste -ge ${billet[indice]}
        do
            reste=$((reste-${billet[indice]}));
            monnaie[indice]=$((${monnaie[indice]}+1));
        done
        indice=$((indice+1));
    done

    for i in ${!billet[@]}
    do  
        if test ${monnaie[$i]} -gt 0
        then
            if test ${billet[$i]} -ge 5
            then
                echo "${monnaie[$i]} billets de ${billet[$i]}";
            else
                echo "${monnaie[$i]} pieces de ${billet[$i]}";
            fi
        fi
    done
    client=$((client+1));
    shift;
done