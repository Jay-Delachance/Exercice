#!/bin/bash

if [ -e $1 ]                             # Vérifie si le fichier indiqué en paramètre 1 existe. On utilise ici le fichier dico.txt
then
        echo "Le fichier existe"         # Le message "Le fichier existe" s'affiche si le fichier existe
else
        echo "Le fichier n'existe pas"   # Le message "Le fichier n'existe pas" s'affiche si le fichier n'existe pas
fi

if [ -z $2 ]                             # Vérifie si le paramètre 2 est vide
then
        for letter in {A..Z}             # Pour chaque lettre de A à Z
        do
                echo "$(grep -ic "$letter" $1) - $letter"      # Si le paramètre 2 est vide, affiche le nombre de mots qui contiennent chaque lettre de l'alphabet, en deux colonnes : d'un côté le nombre de mots et de l'autre côté, la lettre correspondante
        done | sort -rn                  # Affiche le tout en ordre décroissant
else
        wc -wmL $1                       # Si le paramètre 2 est non vide, affiche le nombre de mots total, le nombre de caractères total, la longeur de la ligne la plus grande du fichier du paramètre 1
        awk '{ for ( i=1; i<=NF; i++ )
                if ( length($i) > L )
                { L=length($i) ; s=$i } }
        END { print s }' $1
fi

# Pour "awk, je me permets de mettre les commentaires à part car cela faisait planter le code. 
# Ligne 1 du awk : Pour le mot i dont la longueur est 1 caractère, on incrémente d'un caractère supplémentaire, un à un jusqu'à obtenir le nombre de caractères le plus long, contenus dans un mot
# Lignes 2 et 3 du awk : Si la longueur de "i" est supérieure à la dernière valeur de "i" et qu'il n'y a pas plus grand alors on arrête l'incrémentation. On a trouvé le mot le plus long.
# Ligne 4 du awk : Affiche le résultat de la recherche sur le paramètre 1 (dico.txt ici). "ANTICONSTITUTIONNELLEMENT" s'affiche. Ce mot contient bien 25 caractères comme indiqué sur la ligne précédente affichée grâce au code "wc -wmL $1".


# Commentaire général : dans l'invité de commaindes, bien penser à taper "./langstat.sh dico.txt" en se trouvant dans le dossier où les fichiers "langstat.sh" et "dico.txt" se trouvent. Pour tester le paramètre 2, vous pouvez indiquez n'imporque quel mot. Merci pour votre correction. :)

