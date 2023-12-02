-- La funzione polinomio prende una lista di coefficienti e un valore x e 
-- restituisce il valore del polinomio corrispondente in x.

polinomio :: [Float] -> Float -> Float
polinomio cs x = sum (map (uncurry (*)) (zip cs (map (x ^) [0..])))