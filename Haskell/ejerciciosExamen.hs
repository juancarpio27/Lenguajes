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


integerToList 0 = []
integerToList num = integerToList (num `div` 10) ++ [num `mod` 10] 

listToInteger [] _ = 0
listToInteger list n = listToInteger (init list) n*10 + (last list) * n

convertList list = listToInteger list 1

rotate list = (tail list) ++ [head list]

isPrimeCircular list baselist
	| (isPrime (convertList list)) && (list == baselist) = True
	| not (isPrime (convertList list)) = False
	| otherwise = 
		if isPrime (convertList list)
		then isPrimeCircular (rotate list) baselist
		else False

isPrimeCircularNum n = isPrimeCircular (integerToList n) (rotate (integerToList n))

countPrimeCircular list = length [x | x <- list, isPrimeCircularNum x]

	

