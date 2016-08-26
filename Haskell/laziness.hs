operacion _ [] _ = []
operacion _ _ []  = []
operacion f (hx: tx) (hy: ty) = [hx + hy] ++ operacion f tx ty

seleccion f n lista = [x | x <- lista , x `f` n]

seleccion_recursiva _ _ [] = []
seleccion_recursiva f n lista = 
	if (head lista) `f` n 	
	then [head lista] ++ seleccion_recursiva f n (tail lista)
	else seleccion_recursiva f n (tail lista)

otrofiltra _ [] = []
otrofiltra f (h:t) 
	| f h = h : otrofiltra f t 
	| otherwise = otrofiltra f t

divisible :: Int -> [Int] -> Int
divisible n [] = -1
divisible n list
	| (last list) `mod` n == 0 = (last list)
	| otherwise = divisible n (init list) 