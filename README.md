# Prolog
Un repo qui contient la résolution de quelques problèmes logiques en utilisant le langage de programmation Prolog et de la récursion.  
Les sujets ont été rédigés par moi, parfois avec l'aide de mon professeur.

### Interrogation du moteur pl  
Dans le fichier `src/interro_base.pl`, vous trouverez une petite base de données que vous pouvez interroger.  
Il y a également un petit exercice amusant sur "qui vole quoi ?" ;)
### Exercices de satisfactions de contraintes (CSP)
Ce type d'exercice présente des problèmes soumis à des contraintes.  
Par exemple, dans le fichier `src/CSP.pl`, vous trouverez l'énoncé et la solution d'un problème rencontré par une entreprise.  
Il s'agit de planifier les vacances des employés en respectant des contraintes telles que : qui ne doit pas partir juste après qui, qui ne peut pas partir en premier ou en dernier, etc.

## Cript_arithmetique
Vous trouverez l'énoncé et la solution dans le fichier .pl correspondant.  
Une petite illustration du problème :  
<img src="images/arithmetique.png" alt="illustraion criptarithmetique">  
Testez et vérifiez si les valeurs trouvées sont correctes en effectuant le calcul.  
Vous trouverez un exemple d'exécution avec la réponse du moteur Prolog.

## Triangle de nombres
Vous trouverez également l'énoncé et la solution dans le fichier `src/criptarithmetique.pl`.  
Ce fichier suit la même logique que le problème décrit ci-dessus.  
Une petite illustration :  
<img src="images/triangle_nombre.png" alt="illustration triangle de nombres">  
Là aussi, je vous invite à examiner l'exécution et la réponse du moteur Prolog, puis à vérifier si les valeurs fournies permettent de résoudre le problème.

## Problème du zèbre 
J'ai trouvé ce problème assez amusant.
Il s'agit de déduire, à partir d'une grande base d'informations, qui est le propriétaire du zèbre et qui boit du vin.  
Je vous invite à consulter le fichier `.pl` correspondant.

## Labyrinte  
Un petit problème de recherche dans un graphe d'états.  
Nous avons un labyrinthe en image : on le modélise, puis on essaie de trouver un chemin d'un point à un autre.  
Vous trouverez le code dans le fichier `.pl` correspondant.  
N'hésitez pas à imaginer votre propre labyrinthe et à varier les paramètres pour obtenir la solution.  

<img src="images/labyrinte.png" alt="une photo du labyrinte">  

## Installation de Swi-Prolog sur linux  
Pour installer prolog sous linux et pouvoir exécuter le code et voir la résolution , il faut taper:  
```bash
sudo apt update
sudo apt install swi-prolog
```
Pour verifier qu'il s'est bien installé, tapez sur votre terminal la commande :
``` bash
swipl
```  
Si tout s'est bien passé, vous aurez l'interface de swi-prolog avec un `?-` qui s'affiche. 

## Compilation et Execution  
### Compliation
Pour compiler, il faut charger le fichier dans la mémoire prolog.  
Pour faire ça, placez vous dans le répertoire qui contient votre fichier avant d'ouvrir l'interface prolog.  
Ensuite, ouvrez l'interface, et chargez le fichier en tappant `[nom_du_fichier].` sans son extention.  
Par exemple pour le fichier `CSP.pl`, il vous faudra taper : `[CSP].`  
Le point "." à la fin est très important. C'est la syntaxe de prolog.  
Si tout se passe bien, l'interface vous affichera `true.`. Cela signifie que le fichier est chargé en mémoire et prêt à être exécuté.

### Execution
Cette partie consiste à appeler les fonctions pour voir ce qu'elles donnent comme resulat.  
Dans chaque fichier, vous trouverez des explications et un exemple de comment vous pouvez appeler la fonction pour voir son exécution.   
Par exemple dans le fichier `CSP.pl` il y'a des explications sur comment exécuter et ce qu'il vous repondra.


### Amusez vous et trouver d'autres problèmes que vous pourriez modéliser de la même manière et essayez de les resoudre. 

#### Je vous propose celui ci : 

    5 personnes (Marie, Lucas, Abdel, Mamadou, Evelyn) habitent dans un immeuble de 5 étages (un appartement par étage).  

    Marie n'habite pas au 4e, et Lucas pas au RDC.  
    Abdel n'habite ni au 4e ni au RDC et n'habite pas un étage adjacent à celui d'Evelyn ni celui de Lucas.  
    Mamadou habite un étage plus haut que Abdel.
    Qui habite à quel étage ? 




