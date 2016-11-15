replace(X,Y,Z,W) :- X == Z -> W is Y.
replace(X,_,Z,W) :- X \= Z -> W is Z.

%replace(X,Y,X,Y).
%replace(_,_,Z,W).

plusone(X,Y) :- Y is X + 1.

german("we","wir").
german("are","sind").
german("in","im").
german("class","klasse").

