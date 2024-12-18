/* tp labyrinte */

couloir(entree,thesee).
couloir(thesee,minotaure).
couloir(thesee,salle_sombre).
couloir(minotaure,sortie).
couloir(salle_sombre,sortie).
couloir(salle_sombre,salle_claire).
couloir(salle_claire,sortie).
couloir(salle_claire,ariane).
couloir(entree,ariane).
sont_lies(A,B):- couloir(A,B).
sont_lies(A,B):- couloir(B,A).

/*
  Le prédicat chemin(X, Y, Parcours, ListeTaboue) X et Y sont respectivement, où je me trouve et où je vais.
  Parcours donne sous forme de liste, les endroits traversés, et ListeTaboue indique les endroits par lesquels,
  on ne veut pas passer (ou passer de nouveau). Au minimum, cette liste doit avoir l'endroit d'où on veut partir, pour éviter les boucles.

  
  le ! c'est pour couper la sortie (on ne repart pas de la sortie pour chercher la sortie sortie).
  Si 2 endroits sont liés , je n'ai plus besion de backtracker
*/

chemin(X,Y,[X,Y],_):- sont_lies(X,Y),!.
chemin(X,Y,[X|Parcours],L):- sont_lies(X,T), not(member(T,L)),
                              chemin(T,Y,Parcours,[T|L]).

/* 
    Exemple d'éxécution : vous pourrez vérifier sur la photo du labyrinte que tout est okay.
    Amusez vous à faire vos propres labyrintes aussi.
    
    ?- chemin(entree,sortie,L,[entree]).
    L = [entree, thesee, minotaure, sortie] ;
    L = [entree, thesee, salle_sombre, sortie] ;
    L = [entree, ariane, salle_claire, sortie] ;
    false.

    Un autre, en allant de la salle claire au minotaure (sans passer par la sortie par exemple)
    ?- chemin(salle_claire,minotaure,L,[salle_claire,sortie]).
    L = [salle_claire, ariane, entree, thesee, minotaure] ;
    L = [salle_claire, salle_sombre, thesee, minotaure].
*/
