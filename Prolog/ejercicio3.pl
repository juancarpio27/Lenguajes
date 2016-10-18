%!Pertenece el elemento a la lista?

inList(X,[X|_]).
inList(X,[_|T]) :- inList(X,T).

%!Imprimir la posicion en la que se encuentra la coincidencia

position(X,[X|_],Cont).
position(X,[_|T],Cont) :- position(X,T,Cont+1).

%!Buscar el maximo en una lista 