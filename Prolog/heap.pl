%% insert(Elem,empty,heap(Elem,empty,empty)) :- !.

%% insert(Elem,heap(X,empty,empty),Sol) :-
%% 	Elem < X,
%% 	Sol = heap(X,heap(Elem,empty,empty),empty),!.

%% insert(Elem,heap(X,empty,empty),Sol) :-
%% 	X < Elem,
%% 	Sol = heap(Elem,heap(X,empty,empty),empty),!.

%% insert(Elem,heap(X,Left,empty),Sol) :-
%% 	Elem < X,
%% 	Sol = heap(X,Left,heap(Elem,empty,empty)),!.

%% insert(Elem,heap(X,Left,empty),Sol) :-
%% 	X < Elem,
%% 	Sol = heap(Elem,Left,heap(X,empty,empty)),!.

%% insert(Elem,heap(X,Left,Right),heap(X,NewLeft,NewRight)) :-
%% 	insert(Elem,Left,NewLeft),
%% 	insert(Elem,Right,NewRight).

insertOnList(Elem,List,Sol) :- 
	append(List,[Elem],Sol).

indexOf([Element|_], Element, 0).
indexOf([_|Tail], Element, Index):-
  indexOf(Tail, Element, Index1), 
  Index is Index1+1.

elementInIndex(0,[H|_],H).
elementInIndex(Num,[_|T],Sol) :-
	X is Num - 1,
	elementInIndex(X,T,Sol). 

list_i_j_swapped(As,I,J,Cs) :-
   same_length(As,Cs),
   append(BeforeI,[AtI|PastI],As),
   append(BeforeI,[AtJ|PastI],Bs),
   append(BeforeJ,[AtJ|PastJ],Bs),
   append(BeforeJ,[AtI|PastJ],Cs),
   length(BeforeI,I),
   length(BeforeJ,J).

sizeOfList([],0).
sizeOfList([_|T],Sol) :-
	sizeOfList(T,X),
	Sol is 1 + X.

insert(Elem,[],Sol) :-
	insertOnList(Elem,[],Sol).

insert(Elem,List,Sol) :-
	insertOnList(Elem,List,Partial),
	sizeOfList(Partial,Size),
	NewSize is Size - 1,
	reHeap(Partial,NewSize,Sol).

reHeap(List,0,List).

reHeap(List,Position,Sol) :-
	elementInIndex(Position,List,ValueChild),
	ParentIndex is (Position - 1) / 2,
	elementInIndex(ParentIndex,List,ValueParent),
	ValueParent < ValueChild,
	list_i_j_swapped(List,Position,ParentIndex,NewList),
	reHeap(NewList,ParentIndex,Sol).

reHeap(List,Position,List) :-
	elementInIndex(Position,List,ValueChild),
	ParentIndex is (Position - 1) / 2,
	elementInIndex(ParentIndex,List,ValueParent),
	ValueParent >= ValueChild.



