-- L'identità sui booleani si può scrivere come:

id_bool :: Bool -> Bool
id_bool = not . not