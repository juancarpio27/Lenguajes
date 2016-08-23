fact 0 sol = sol
fact 1 sol = sol
fact x sol = fact (x-1) (x*sol)

factorial_tail x r = 
 if x == 1
 then r
 else factorial_tail (x-1) (x*r)

fact_2 x = 
 factorial (x-1) x
 where factorial x res
 	| x < 0 = 1
 	| x == 1 = res
 	| otherwise = factorial (x-1) (res*x)


insert e [] = [e]
insert e list = 
 if e < (head list) 
 then e : list
 else (head list) : insert e (tail list)
insertion_sort list = sort list [] where 
 sort [] list = list
 sort (x:xs) list = sort xs (insert x list)


insertionSort [] = []
insertionSort (h:[]) = [h]
insertionSort (h:t) = 
	let insert num [] = [num] 
	    insert num (h:t) =  
			if num > h  
			then h : insert num t 
			else num : h : t 
	in insert h (insertionSort t)

insertionSort2 [] = []
insertionSort2 (h:[]) = [h]
insertionSort2 (h:t) = 
	let lc x lista = [y | y <- lista, x > y] ++ [x] ++ [y | y <- lista, x <= y]
	in lc h (insertionSort2 t)


