inList(X, [X|_], Cont, Z) :- Z is Cont.
inList(X, [_|T], Cont, Z) :- inList(X,T,Cont+1,Z).

natural(0,0).
natural(suc(X),(N)) :- natural(X,S), N is S+1.

sizeList([],0).
sizeList([_|T],S) :- sizeList(T,F), S is F+1. 

isLast([], false).
isLast([H|[]], H).
isLast([_|T],S) :- isLast(T,S).

myAppend([],Y,[Y]).
myAppend([H|T],Y,[H|Z]) :- myAppend(T,Y,Z). 

removeElement(_,[],[]).
removeElement(X,[X|T],Sol) :- removeElement(X,T,Sol).
removeElement(X,[H|T],[H|T2]) :- X \= H, removeElement(X,T,T2). 
