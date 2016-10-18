%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% quicksort
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

quicksort([X|Xs],Ys) :-
partition(Xs,X,Left,Right),
quicksort(Left,Ls),
quicksort(Right,Rs),
append(Ls,[X|Rs],Ys).

quicksort([],[]).

partition([X|Xs],Y,[X|Ls],Rs) :-
X =< Y, partition(Xs,Y,Ls,Rs).
partition([X|Xs],Y,Ls,[X|Rs]) :-
X > Y, partition(Xs,Y,Ls,Rs).
partition([],_,[],[]).

append([],Ys,Ys).
append([X|Xs],Ys,[X|Zs]) :- append(Xs,Ys,Zs).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% mergesort
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
merge_sort([],[]).
merge_sort([X],[X]).  
merge_sort(List,Sorted):-
    List=[_,_|_],
    divide(List,L1,L2),     
	merge_sort(L1,Sorted1),
	merge_sort(L2,Sorted2),  
	merge(Sorted1,Sorted2,Sorted). 

merge([],L,L).
merge(L,[],L):-L\=[].
merge([X|T1],[Y|T2],[X|T]):- X=<Y,merge(T1,[Y|T2],T).
merge([X|T1],[Y|T2],[Y|T]):- X>Y,merge([X|T1],T2,T).

divide(L,L1,L2):-halve(L,L1,L2).

halve(L,A,B):-hv(L,[],A,B).

hv(L,L,[],L).
hv(L,[_|L],[],L).  
hv([H|T],Acc,[H|L],B):-hv(T,[_|Acc],L,B).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% insertionsort
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

insert_sort(List,Sorted):-i_sort(List,[],Sorted).

i_sort([],Acc,Acc).
i_sort([H|T],Acc,Sorted):-insert(H,Acc,NAcc),i_sort(T,NAcc,Sorted).
   
insert(X,[Y|T],[Y|NT]):-X>Y,insert(X,T,NT).
insert(X,[Y|T],[X,Y|T]):-X=<Y.
insert(X,[],[X]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% bubble_sort
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bubble_sort(List,Sorted):-b_sort(List,[],Sorted).

b_sort([],Acc,Acc).
b_sort([H|T],Acc,Sorted):-bubble(H,T,NT,Max),b_sort(NT,[Max|Acc],Sorted).
   
bubble(X,[],[],X).
bubble(X,[Y|T],[Y|NT],Max):-X>Y,bubble(X,T,NT,Max).
bubble(X,[Y|T],[X|NT],Max):-X=<Y,bubble(Y,T,NT,Max).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% bucket_sort
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Max
my_max([], R, R).
my_max([X|Xs], WK, R):- X >  WK, my_max(Xs, X, R).
my_max([X|Xs], WK, R):- X =< WK, my_max(Xs, WK, R).
my_max([X|Xs], R):- my_max(Xs, X, R). 

%Min
my_min([],R,R).
my_min([X|Xs], WK, R) :- X < WK, my_min(Xs,X,R).
my_min([X|Xs], WK, R) :- X >= WK, my_min(Xs,WK,R).
my_min([X|Xs], R) :- my_min(Xs, X, R).

bucket(isBucket(_,_,[]),isBucket(_,_,[]),[]).
bucket(isBucket(A,B,[H|R]), isBucket(C,D,List),[H|T]) :- H >= A, H =< B, bucket(isBucket(A,B,R),isBucket(C,D,List),T).
bucket(isBucket(A,B,List),isBucket(C,D,[H|R]),[H|T]) :- H >= C, H =< D, bucket(isBucket(A,B,List),isBucket(C,D,R),T).

bucketSort(List,L) :- my_max(List,Max), my_min(List, Min), bucket(isBucket(Min,(Max-Min)/2,A),isBucket((Max-Min)/2 + 1,Max,B),List), quicksort(A,S), quicksort(B,R),append(S,R,L).