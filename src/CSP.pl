/* 
Une entreprise doit organiser le départ en vacances de cinq de ses employés : 
Michel, Antoine, Robert, Naomie, et Olivier. Ils partiront chacun à un moment différent, 
mais il faut respecter certaines contraintes pour déterminer l'ordre dans lequel ils partiront.

Les contraintes sont les suivantes :

    Michel ne partira pas en dernier.
    Antoine ne sera pas le premier à partir.
    Robert ne partira ni en premier , ni en dernier.
    Naomie partira après Antoine, mais pas forcément juste après.
    Olivier et Robert ne partiront pas juste l'un après l'autre.
    Antoine et Robert ne partiront pas juste l'un après l'autre non plus. 
*/

/* 
    Le predicat adjacent(X1,X2), prend X1 et X2 qui sont 2 données
    Le predicat est vrai si la valeur absolue de leur difference est differente de 1
    Cela permet notament pour 2 personnes ne peuvent pas partir l'un après l'autre
*/
    adjacent(X1, X2) :-
    abs(X1 - X2) =:= 1.

/* vacance est une liste de paire (rang pour partir, personne qui doit partir)
    En prolog, le "_" permet de construire en laissant une inconnue    
*/
vacance([[1,_],[2,_],[3,_],[4,_],[5,_]]).

/* Le predicat solution prend une variable resultat (variable en majuscule) et renvoie la solution pour partir en vacances*/ 
solution(S):-
    vacance(S),
    member([E0,michel],S),
    member([E1,antoine],S),
    member([E2,robert],S),
    member([E3,naomie],S),
    member([E4,olivier],S),
    E0 \== 5,
    E1\==1,
    E2 \== 1, E2 \== 5,
    E3 > E1,
    not(adjacent(E2,E4)),
    not(adjacent(E1,E2)).


/*
    Exemple de compilation et d'execution:
    Apres avoir ouvert l'interface prolog dans le repertoire où le fichier se trouve, faites :
    ?- [vacance].
    il repondra :
    true.

    ?- solution(S).
    S = [[1, olivier], [2, antoine], [3, michel], [4, robert], [5, naomie]] ;
    false.

    Notez que le ";" permet de demander au moteur prolog une autre solution du probleme, il va backtracker et 
    si il ne trouve pas d'autres solutions, Il vous repondra : false. 
*/
