--Ejercicio 2
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci(n-1) + fibonacci(n-2)

--Ejercicio 1
palindromo n = (show n) == reverse (show n)


palindromoMultiplicacion x y list n
	| x == (10^(n-1)) && y == (10^(n-1)) =
		if palindromo (x*y) 
		then  list ++ [x*y]
		else list
	| palindromo (x*y) && x > (10^(n-1)) = palindromoMultiplicacion (x-1) y (list ++ [x*y]) n
	| not (palindromo (x*y)) && y > (10^(n-1)) = palindromoMultiplicacion x (y-1) list n
	| otherwise = palindromoMultiplicacion (x-1) (10^n - 1) list n

palindromoDigitos n = maximum (palindromoMultiplicacion (10^n - 1) (10^n - 1) [] n)