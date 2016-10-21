fibonacci(1,1).
fibonacci(2,1). 
fibonacci(X,R):-  X1 is X - 1, fibonacci(X1,Y),X2 is X -2, fibonacci(X2,Z), R is Z+Y.

fibonacci_array(_,I) :- I == 0.
fibonacci_array(N,I) :- fibonacci(I,S), I2 is I - 1, fibonacci_array(N,I2), write(S), write(" ").

move(1,X,Y,_) :-  
    write('Move top disk from '), 
    write(X), 
    write(' to '), 
    write(Y), 
    nl. 
move(N,X,Y,Z) :- 
    N>1, 
    M is N-1, 
    move(M,X,Z,Y), 
    move(1,X,Y,_), 
    move(M,Z,Y,X).  

change([H|_],Dest,[H|Dest]).

hanoi(1,[H|T],Dest,Aux, R1, R2, R3) :-
	R1 = T,
	R2 = [H|Dest],
	R3 = Aux.

hanoi(N,Source,Dest,Aux,R1,R2,R3) :-
	N > 1,
	M is N - 1,
	hanoi(M,Source,Aux,Dest,A1,B1,C1),
	hanoi(1,A1,C1,B1, A2,B2,C2),
	hanoi(M,C2,B2,A2 ,R1,R2,R3).





