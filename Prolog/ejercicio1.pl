father(terach,nachor).
father(terach,haran).
father(terach,abraham).
father(haran,lot).
father(haran,mismcah).
father(haran,yiscah).
father(abraham,sarah).
mother(sarah,isaac).
male(terach).
male(haran).
male(abraham).
male(lot).
male(nachor).
male(isaac).
female(sarah).
female(milcah).
female(yiscah).

son(X,Y):-father(Y,X),male(X).
grandfather(X,Y):-father(X,Z),father(Z,Y),male(X).
grandfather(X,Y):-father(X,Z),mother(Z,Y),male(X).

parent(X,Y):-father(X,Y).
parent(X,Y):-mother(X,Y).
grandparent(X,Y):-parent(X,Z),parent(Z,Y).

brother(X,Y):-parent(Z,X),parent(Z,Y),male(Y),X\=Y.

ancestor(X,Y):-parent(X,Y).
ancestor(X,Y):-parent(X,Z),ancestor(Z,Y).