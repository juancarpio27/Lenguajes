test = (\x -> x)

divisible x lista =
	if (length [y | y <- lista, x `mod` y == 0 ]) == (length lista)
	then x 
	else divisible (x+1) lista

isPrime k = null [ x | x <- [2..k-1], k `mod`x  == 0]

nextPrime k
	| isPrime (k+1) = k+1
	| otherwise = nextPrime (k+1)

kprime k limit lastPrime
	| k == limit = lastPrime
	| otherwise = kprime (k+1) limit (nextPrime lastPrime)


total [] = 0
total lista = head lista + total (tail lista)

biggesSum list limit
	| isPrime (total (init list)) && ((total list) > limit) = (total (init list))
	| otherwise = biggesSum (list ++ [nextPrime (last list)]) limit

