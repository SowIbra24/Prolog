/* Pour les 2 problemes, il y'a des illustrations en image dans le readme*/

/* +++++++++++++++ Criptarithmetique ++++++++++++++++ */

/*  prédicat hors_de(X,L) qui est satisfait si X
n’est pas élément de la liste L. */

hors_de(_,[]).
hors_de(X,[Y|L]):- X\==Y, hors_de(X,L).

/* prédicat valeur(X,Xmin,Xmax,L) qui donne une valeur entière X comprise
entre Xmin et Xmax qui n’est pas dans la liste L. C’est-à-dire qu’en demandant
toutes les solutions au prédicat quand X est inconnu, toutes les valeurs sont
énumérées. */
valeur(X,Xmin,_,L):- X is Xmin, hors_de(X,L).
valeur(X,Xmin,Xmax,L):- Xmin1 is Xmin+1, Xmin1 =< Xmax, valeur(X,Xmin1,Xmax,L).

/* prédicat trente([V,I,N,G,T,C,Q,R,E]) qui trouve les valeurs qui permettent
de résoudre l’addition. On utilisera le modulo et la retenue */

trente([V,I,N,G,T,C,Q,R,E]) :-
              valeur(E,1,9,[]),
              valeur(T,1,9,[E]),
              valeur(Q, 1,9,[E,T]),

              E =:= (T+Q+Q) mod 10,
              R1 is  (T+Q+Q) // 10,

              valeur(G,0,9,[E,T,Q]),
              valeur(N,0,9,[E,T,Q,G]),
              T  =:= (R1+G+N+N) mod 10,
              R2 is (R1+G+N+N) //10,

              valeur(I,0,9,[E,T,Q,G,N]),
              N =:= (R2+N+I+I) mod 10,
              R3 is (R2+N+I+I) // 10,

              valeur(C,0,9,[E,T,Q,G,N,I]),

              E =:= (R3+I+C+C) mod 10,
              R4 is (R3+I+C+C) // 10,

              valeur(V,1,9,[E,T,Q,G,N,I,C]),
              valeur(R,0,9,[E,T,Q,G,N,I,C,V]),
              R =:= (R4+V) mod 10,
              T =:= (R4+V)//10 .

/* 
    Exemple d'utilisation:
    ?- [cryptarithmetique].
    true.

    ?- trente([A,B,C,D,E,F,G,H,I]).
    A = 9,
    B = 4,
    C = 8,
    D = 5,
    E = 1,
    F = 6,
    G = 3,
    H = 0,
    I = 7 ;
    false.
    le ";" pour demander une autre reponse 
    Et vu que c'est des variable resultats en entrée (majuscules), le resultat est calculé
    et mis dans les variables 
*/

/* --------------- Triangle de nombres ---------------- */
/* 
    On veut placer les nombres de 1 à 6 en triangle, sur les sommets et sur les milieux des segments, en
    utilisant un nombre une fois seulement, de façon à ce que la somme des trois nombres utilisés soit
    la même pour les trois cotés du triangle.

*/             
/* 
    predicat permute(L1,L2), qui étant donnée la liste L1, construit la liste L2 contenant une
    permutation de L1. 
*/

permute([],[]).
permute(L,[X|L3]):- member(X,L), delete(L,X,L2), permute(L2,L3).

/* 
    nombre_triangle prend une liste des inconnues à placer sur le triangle
    et donne chacun des nombres
*/
nombre_triangle([N1,N2,N3,N4,N5,N6]) :-
                permute([1,2,3,4,5,6],[N1,N2,N3,N4,N5,N6]),
                G is N1+N6+N5,
                B is N5+N4+N3,
                D is N1+N2+N3,
                D == G,
                G == B,
                B == D.

/* 
    Exemple d'exécution:
    ?- nombre_triangle([A,B,C,D,E,F]).
    A = 1,
    B = 4,
    C = 5,
    D = 2,
    E = 3,
    F = 6 ; ";" demande une autre reponse 

    A = 1,
    B = 5,
    C = 3,
    D = 4,
    E = 2,
    F = 6 ; encore une autre 

    A = 1,
    B = 6,
    C = 2,
    D = 4,
    E = 3,
    F = 5 ; ect , ce probleme a beaucoup de solutions et ça marche à chaque fois
*/