boolean(0,false).
boolean(_,true).

%Taken a list, return a search binary tree
fromList([],Tree,Tree).
fromList([H|T],empty,NewTree):- 
	fromList(T,tree(H,empty,empty),NewTree).
fromList([H|T],tree(Element,Left,Right), NewTree2) :- 
	insert(H,tree(Element,Left,Right), NewTree), 
	fromList(T,NewTree,NewTree2).

%Post order array
postOrder(empty,[]).
postOrder(tree(Element,Left,Right), List) :- 
	postOrder(Left, List2), 
	postOrder(Right, List3), 
	append(List2, List3, List4), 
	append(List4,[Element],List).

%Pre order array
preOrder(empty,[]).
preOrder(tree(Element,Left,Right), List) :- 
	preOrder(Left,List2), 
	preOrder(Right,List3), 
	append([Element],List2,List4), 
	append(List4,List3,List).

%In order array
inOrder(empty,[]).
inOrder(tree(Element,Left,Right), List) :- 
	inOrder(Left,List2), 
	inOrder(Right,List3), 
	append(List2,[Element],List4), 
	append(List4,List3,List).

%Height of the tree
height(empty,0).
height(tree(_,Left,Right), Sol) :- 
	height(Left,L1), 
	LeftHeight is 1 + L1, 
	height(Right,R1), 
	RightHeight is 1 + R1, 
	Sol is max(LeftHeight,RightHeight).


%Get elements of the trees
getElem(tree(Num,_,_),Num).
getRightChild(tree(_,_,Right),Right).
getLeftChild(tree(_,Left,_),Left).


%Left Rotation
getLeftChildLR(tree(Num,Left,Right), Sol) :-
	getLeftChild(Right,RightChild),
	Sol = tree(Num,Left,RightChild).
leftRotation(tree(Num,Left,Right), Sol) :-
	getElem(Right, Root),
	getRightChild(Right, RightChild),
	getLeftChildLR(tree(Num,Left,Right),LeftChild),
	Sol = tree(Root,LeftChild,RightChild).

%Right Rotation
getRightChildRR(tree(Num,Left,Right), Sol) :-
	getRightChild(Left,LeftChild),
	Sol = tree(Num,LeftChild,Right).
rightRotation(tree(Num,Left,Right), Sol) :-
	getElem(Left,Root),
	getLeftChild(Left, LeftChild),
	getRightChildRR(tree(Num,Left,Right), RightChild),
	Sol = tree(Root,LeftChild,RightChild).

%Left-Right Rotation
leftRightRotation(tree(Num,Left,Right),Sol):-
	leftRotation(Left,NewLeft),
	NewTree = tree(Num,NewLeft,Right),
	rightRotation(NewTree,Sol).

%Right-Left Rotation
rightLeftRotation(tree(Num,Left,Right),Sol):-
	rightRotation(Right,NewRight),
	NewTree = tree(Num,Left,NewRight),
	leftRotation(NewTree,Sol).

%Balance factor of the tree
balanceFactor(empty,0).
balanceFactor(tree(_,Left,Right),Sol) :- height(Left, LH), height(Right,RH),  Sol is LH - RH.

%Rotate a balance tree
reBalance(empty,empty).

%rightRotation case
reBalance(tree(Num,Left,Right), Sol) :-
	balanceFactor(tree(Num,Left,Right), Balance),
	Balance == 2,
	balanceFactor(Left, SecBalance),
	SecBalance >= 0,
	rightRotation(tree(Num,Left,Right),Sol).

%Left-Right rotation case
reBalance(tree(Num,Left,Right), Sol) :-
	balanceFactor(tree(Num,Left,Right), Balance),
	Balance == 2,
	balanceFactor(Left, SecBalance),
	SecBalance =< -1,
	leftRightRotation(tree(Num,Left,Right),Sol).

%leftRotation case
reBalance(tree(Num,Left,Right), Sol) :-
	balanceFactor(tree(Num,Left,Right), Balance),
	Balance == -2,
	balanceFactor(Right, SecBalance),
	SecBalance =< 0,
	leftRotation(tree(Num,Left,Right),Sol).

%Right-Left rotation case
reBalance(tree(Num,Left,Right), Sol) :-
	balanceFactor(tree(Num,Left,Right), Balance),
	Balance == -2,
	balanceFactor(Right, SecBalance),
	SecBalance >= 1,
	rightLeftRotation(tree(Num,Left,Right),Sol).

%No need for rotation
reBalance(tree(Num,Left,Right), Sol) :-
	balanceFactor(tree(Num,Left,Right), Balance),
	Balance > -2,
	Balance < 2,
	Sol = tree(Num,Left,Right).


%Insert element
%Base case
insert(Num,empty,tree(Num,empty,empty)).
%The element is less than the actual node, go left
insert(Num,tree(Element,Left,Right), Sol) :- 
	Num < Element, 
	insert(Num,Left,NewLeft),
	Partial = tree(Element, NewLeft, Right),
	fixTree(Partial,Sol).
%The element is greater or equal to actual node, go right
insert(Num,tree(Element,Left,Right), Sol) :- 
	Num >= Element, 
	insert(Num,Right,NewRight),
	Partial = tree(Element, Left, NewRight),
	fixTree(Partial,Sol).

%Base case for empty -> stop
fixTree(empty,empty).
%If a node is require to rotate do it and stop, because just 1 rotation will be neccesary
fixTree(tree(Num,Left,Right),Sol) :-
	balanceFactor(tree(Num,Left,Right), Balance),
	Balance == 2,
	reBalance(tree(Num,Left,Right), Sol).
%If a node is require to rotate do it and stop, because just 1 rotation will be neccesary
fixTree(tree(Num,Left,Right),Sol) :-
	balanceFactor(tree(Num,Left,Right), Balance),
	Balance == -2,
	reBalance(tree(Num,Left,Right), Sol).
%If there is no need to rotate on that level, then review the next nodex
fixTree(tree(Num,Left,Right),Sol) :-
	balanceFactor(tree(Num,Left,Right), Balance),
	Balance \= -2,
	Balance \= 2,
	fixTree(Left,NewLeft),
	fixTree(Right,NewRight),
	Sol = tree(Num,NewLeft,NewRight).

%Find element in AVL tree
find(_,empty,0).
%Is the elem? return 1 -> true
find(Num, tree(Num, _, _),1).
%If not, find in the left and right subtree and do an or to find the solution
find(Num, tree(Elem, Left, Right), Sol) :-
	Num \= Elem,
	find(Num,Left,IsInLeft),
	find(Num,Right,IsInRight),
	Sol is IsInLeft + IsInRight.

%minimum element of tree
minimum(empty,0).
minimum(tree(X,empty,_),X).
minimum(tree(_,Left,_),Sol) :-
	minimum(Left,Sol).

%maximum element of tree
maximum(empty,0).
maximum(tree(X,_,empty),X).
maximum(tree(_,_,Right),Sol) :-
	maximum(Right,Sol).


%delete from tree
delete(_,empty,empty).
delete(X,tree(X,empty,empty),empty).
delete(X,tree(X,Left,empty),Left).
delete(X,tree(X,empty,Right),Right).
delete(X,tree(X,Left,Right),tree(Min,Left,NewRight)) :-
	minimum(Right,Min),
	deleteLeftMost(Right,NewRight).
delete(X,tree(Y,empty,empty),tree(Y,empty,empty)) :-
	X \= Y.
delete(X,tree(Y,Left,Right),tree(Y,NewLeft,NewRight)) :-
	X \= Y,
	delete(X,Left,NewLeft),
	delete(X,Right,NewRight).

%Delete the element most at the left
deleteLeftMost(tree(_,empty,empty),empty).
deleteLeftMost(tree(X,tree(_,empty,_),Right),tree(X,empty,Right)).
deleteLeftMost(tree(X,Left,Right), tree(X,NewLeft,Right)) :-
	deleteLeftMost(Left,NewLeft).

%Delete from tree
deleteFromTree(X,tree(Num,Left,Right),Sol) :-
	delete(X,tree(Num,Left,Right),Partial),
	fixTree(Partial,Sol).












