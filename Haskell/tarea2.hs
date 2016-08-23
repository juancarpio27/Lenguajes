quicksort [] = []
quicksort (p:t) = quicksort [x | x <-t, x < p] ++ p ++ quicksort [x | x <-t, x >= p]

raiz x = raizI (1, (1+x)/2, x)
raizI (x, i, n) = 
	if x == i 
	then x
	else raizI ((x+n/x)/2,(i+n/i)/2,n)

