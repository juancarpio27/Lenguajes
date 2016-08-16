fact 1 = 1
fact x = x * fact(x-1)

maximo [] = -1
maximo (a:b:c) = let bigger(a,b) = if a > b then a else b 
			  	 in
			  	 if c == [] then bigger(a,b)
			  	 else maximo([bigger(a,b)] ++ c) 

maximo2 [] = -1
maximo2 list = max (tail list) (head list) 
			   where max list current  
			   		| (length list) == 0 = current 
			   		| (head list) > current = max (tail list) (head list) 
			   		| otherwise = max (tail list) current 

minimax list = (max (tail list) (head list) min (tail list) (head list))
				where max list current  
			   		| (length list) == 0 = current 
			   		| (head list) > current = max (tail list) (head list) 
			   		| otherwise = max (tail list) current 
			   	where min list current 
			   		| (length list) == 0 = current 
			   		| (head list) > current = max (tail list) (head list) 
			   		| otherwise = max (tail list) current 
					



