if  test ! "$1"
then
    echo "Il faut minimum 1 parametres. (le nom du project)";
    exit 1
fi

if [ -e ./"${1}" ]
then
    echo "Le dossier existe déjas";
    exit 2;
fi

mkdir ./"${1}";
cd ./"${1}";
touch "${1}".c;


jour=$(date)
echo "// programme "${1}" genere automatiquement par $0 $jour" > "${1}".c
echo '#include <stdio.h>' >> "${1}".c
echo '' >> "${1}".c
echo 'int main(){' >> "${1}".c
echo '' >> "${1}".c
echo ' printf("Hello world\n");' >> "${1}".c
echo '' >> "${1}".c
echo ' return 0;' >> "${1}".c
echo '}' >> "${1}".c
echo "Fichier '"${1}".c' crée dans $PWD";
gcc "${1}".c -o "${1}" -Wall

if test $? -ne 0
then
    echo "Probleme de compilation";
    exit 3;
fi

echo "Compilation terminé";

if ./"${1}"
then
    echo "Le programme '"${1}"' fonctionne";
else
    echo "Le programme '"${1}"' ne s'execute pas correctement. Code erreur "$?;
    exit 3;
fi