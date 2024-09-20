/* 
    Base de donnée pour faire un arbre généalogique
    Les faits sont par exemple : homme(albert). veut dire que albert est un homme.
    mere(christiane,simone). veut dire christiane est la mère de simone

*/

homme(albert).
homme(jean).
homme(paul).
homme(bertrand).
homme(dominique).
homme(benoit).
femme(germaine).
femme(christiane).
femme(simone).
femme(marie).
femme(sophie).
pere(albert,jean).
pere(jean,paul).
pere(paul,bertrand).
pere(paul,sophie).
pere(jean,simone).
pere(louis,benoit).
mere(germaine,jean).
mere(christiane,simone).
mere(christiane,paul).
mere(simone,benoit).
mere(marie,bertrand).
mere(marie,sophie).

/* est parent si soit pere, soit mere */
  parent(X,Y):- pere(X,Y).
  parent(X,Y):- mere(X,Y).

/* fils(X,Y), est fils si Y est son parent et si X est un homme */
  fils(X,Y):- parent(Y,X), homme(X).

/* pareil pour fille sauf que X femme */
  fille(X,Y):- parent(Y,X), femme(X).

/* grand pere est pere de parents */
grand_pere(X,Y):- pere(X,P) , parent(P,Y).

/* pareil pour grand mere */
grand_mere(X,Y):- mere(X,P), parent(P,Y).

/* frere est fils de mes parents mais qui nest pas moi */
frere(X,Y):- parent(P,Y) , parent(P,X) , homme(Y), X\==Y.

/* pareil pour soeur mais etant fille */
frere(X,Y):- parent(P,Y) , parent(P,X) , femme(Y), X\==Y.

/* interrogation par exemple 
  ?- [interro_base].
  true.

  Chercher les hommes de ma base , pareil pour les femmes 

  ?- homme(X).
  X = albert ;
  X = jean ;
  X = paul ;
  X = bertrand ;
  X = dominique ;
  X = benoit.

  Chercher la mère de jean
  ?- mere(X,jean).
  X = germaine.

  Amusez vous pour tester la base avec les questions

  Est-ce que Paul est un homme ?
  Est-ce que Benoit est une femme ?
  Qui est une femme ?
  Qui est un homme ?
  Est-ce que Marie est la mère de Sophie ? de
  Benoit ?
  Qui est la mère de Jean ?
  Quels sont les enfants de Paul ?
  Quels sont les hommes qui sont pères ?

 */

 /* petit exo de logique x)

    Marie aime le vin
    Pierre est un voleur
    Pierre aime tous ceux qui aiment le vin
    Si quelqu'un est un voleur et aime quelque chose alors il le vole
    Qui vole quoi ?

*/

aime(marie,vin).
aime(pierre,X):- aime(X,vin).
voleur(pierre).
voler(X,Y):- voleur(X), aime(X,Y).

/* exemple d'exécution 

  ?- voler(X,Y).
  X = pierre,
  Y = marie ;
  X = qui vole
  Y = qui
  Donc pierre vole marie

*/
