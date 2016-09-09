--Ejercicio 2
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci(n-1) + fibonacci(n-2)

--Ejercicio 1
palindromo n = (show n) == reverse (show n)

palindromoMultiplicacion x y 
	| palindromo (x*y) = (x*y)
	| not (palindromo (x*y) && y > 10) = palindromoMultiplicacion x (y-1)
	| otherwise = palindromoMultiplicacion (x-1) 99

palindromoDigitos n = palindromoMultiplicacion (10^n-1) (10^n-1)