-- La funzione liste restituisce le liste più lunghe tra quelle fornite in input.

liste :: [[a]] -> [[a]]
liste xs = filter ((== maximum (map length xs)) . length) xs