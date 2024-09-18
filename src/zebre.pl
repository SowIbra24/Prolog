/* 
On considère cinq maisons, toutes de couleur différente
(rouge, bleu, jaune, blanc, vert), dans lesquelles logent cinq professionnels
(peintre, sculpteur, diplomate, docteur et violoniste) de nationalité différente
(anglaise, espagnole, japonaise, norvégienne et italienne) ayant chacun une
boisson favorite (thé, jus de fruits, café, lait et vin) et un animal favori
(chien, escargot, renard, cheval et zèbre) 

On dispose des faits suivants :
1. l’Anglais habite la maison rouge
2. l’Espagnol possède un chien
3. le Japonais est peintre
4. l’Italien boit du thé
5. le Norvégien habite la première maison à gauche
6. le propriétaire de la maison verte boit du café
7. la maison verte est juste à droite de la blanche
8. le sculpteur élève un escargot
9. le diplomate habite la maison jaune
10. on boit du lait dans la maison du milieu
11. le Norvégien habite à coté de la maison bleue
12. le violoniste boit du jus de fruit
13. le renard est dans une maison voisine du médecin
14. le cheval est à coté de la maison du diplomate
Il s’agit de trouver le possesseur du zèbre et le buveur de vin


*/

/* prédicat meme_maison(X,L1,Y,L2) vrai si X et Y sont dans la même position dans les
listes L1 et L2. Par exemple pour le fait 1, on pourra dire que l‘anglais est à la même place dans la
liste N (liste des nationalités) que rouge dans la liste C (liste des couleurs). */

meme_maison(X,[X|_],Y,[Y|_]).
meme_maison(X,[_|L1],Y,[_|L2]) :- meme_maison(X,L1,Y,L2).

/* rédicat maison_a_cote(X,L1,Y,L2) vrai si X et Y sont dans des positions voisines dans
les listes L1 et L2. */
maison_a_cote(X,[X|_],Y,[_,Y|_]).
maison_a_cote(X,[_,X|_],Y,[Y,_|_]).
maison_a_cote(X,[_|L1],Y,[_|L2]) :- maison_a_cote(X,L1,Y,L2).

maison_a_droite(X,Y,[X,Y|_]).
maison_a_droite(X,Y, [_|L1]) :- maison_a_droite(X,Y,L1).

/* zebre qui prend C,N,B,A,P qui sont repectivement des listes de 
Couleur de leur maison, Nationalité, Boisson, Animal, Profesion , 
Poszebre,BoitVin qui sont des variables reulatats qui disent à qui appartient 
le zebre et qui boit du vin 
 */
zebre(C,N,B,A,P,PosZebre,BoitVin):-
            C = [_,_,_,_,_],
            N = [norvegien,_,_,_,_],
            B = [_,_,lait,_,_],
            A = [_,_,_,_,_],
            P = [_,_,_,_,_],
            meme_maison(anglais,N,rouge,C),
            meme_maison(espagnol,N,chien,A),
            meme_maison(japonais,N,peintre,P),
            meme_maison(italien,N,the,B),
            meme_maison(vert,C,cafe,B),
            maison_a_droite(vert,blanc,C),
            meme_maison(sculpteur,P,escargot,A),
            meme_maison(diplomate,P,jaune,C),
            maison_a_cote(norvegien,N,bleu,C),
            meme_maison(violoniste,P,jus_de_fruit,B),
            maison_a_cote(renard,A,medecin,P),
            maison_a_cote(cheval,A,diplomate,P),
            meme_maison(PosZebre,N,zebre, A),
            meme_maison(BoitVin,N,vin,B).

/* Exemple d'exécution :

    ?- [zebre].
    true.

    ?- zebre(C,N,B,A,P,PosZebre,BoitVin).
    C = [jaune, bleu, rouge, vert, blanc],
    N = [norvegien, italien, anglais, japonais, espagnol],
    B = [vin, the, lait, cafe, jus_de_fruit],
    A = [renard, cheval, escargot, zebre, chien],
    P = [diplomate, medecin, sculpteur, peintre, violoniste],
    PosZebre = japonais,
    BoitVin = norvegien ;
    false.

*/