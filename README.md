# Prolog
Un repo qui contient la résolution de quelques problemes logiques en utilisant le langage de programmation prolog

### Exercices de satisfactions de contraintes (CSP)
Ce type d'exercices pose des problèmes qui ont des contraintes.  
Par exemple dans le fichier `CSP.pl`, vous trouverez l'enoncé et le corrigé d'un problème qu'une entreprise rencontre.  
Il y'a des employés qui doivent aller en vacances et il y'a des contraintes sur qui ne doit pas partir juste après un autre, qui ne peut pas partir en premier ou dernier etc.  

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
Si tout s'est bien passé, vous aurez l'interface de swi-prolog avec un '?-' qui s'affiche. 

## Compilation et Execution  
### Compliation
Pour compiler, il faut charger le fichier dans la mémoire prolog.  
Pour ça, placez vous dans le répertoire qui contient votre fichier avant d'ouvrir l'interface prolog.  
Ensuite, ouvrez l'interface, et chargez le fichier en faisant `[nom_du_fichier].` sans son extention.  
Par exemple pour le fichier `CSP.pl`, il vous faudra juste taper : `[CSP].`  
Le point "." à la fin est très important. C'est la syntaxe de prolog.  
Si tout se passe bien, l'interface vous affichera `true`. Cela signifie que le fichier est chargé en mémoire et prêt à être exécuté.

### Execution
Cette partie consistera juste à appeler les fonctions pour voir ce qu'elles donnent comme resulat.  
Dans chaque fichier, vous trouverez des explications et un exemple de comment vous pouvez appeler la fonction pour voir son exécution.   
Par exemple dans le fichier `CSP.pl` il y'a des explications sur comment exécuter et ce qu'il vous repondra.

<div style="color:blue; font-size:1.2em;"> Amusez vous et trouver d'autres problèmes que vous pourriez modéliser le même manière et essayez de les resoudre. <br>
<div style="color:white"> Je vous propose lui : 
    5 personnes (Marie, Lucas, Abdel, Mamadou, Evelyn) habitent dans un immeuble 
        de 5 étages (un appartement par étage).
    Marie n'habite pas au 4e, et Lucas pas au RDC. Abdel n'habite ni au 4e ni au RDC 
        et n'habite pas un étage adjacent d'Evelyn ni celui de Lucas. Mamadou habite 
        un étage plus haut que Abdel.
    Qui habite à quel étage ? </div> </div>

