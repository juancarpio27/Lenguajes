next(X,Y):- Y is X+1.

replace(X,Y,Z,W) :- X == Z -> W is Y.
replace(X,_,Z,W) :- X \= Z -> W is Z.

myMapList(_,[],[]).
myMapList(Func, [H|T], [R|T2]):-
 	Func=..[Goal|Params],
 	append(Params,[H,R],NewParams),
 	Pred=..[Goal|NewParams],
 	call(Pred),
 	myMapList(Func,T,T2).