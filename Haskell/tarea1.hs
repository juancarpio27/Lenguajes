maximo [] = -1
maximo list = max (tail list) (head list) where max list current | (length list) == 0 = current | (head list) > current = max (tail list) (head list) | otherwise = max (tail list) current

minimo [] = -1
minimo list = min (tail list) (head list) where min list current | (length list) == 0 = current | (head list) < current = min (tail list) (head list) | otherwise = min (tail list) current

let minimax lista = [[maximo(x),minimo(x)] | x <- lista ]

