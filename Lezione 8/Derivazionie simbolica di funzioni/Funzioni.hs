-- Le funzioni si possono rappresentare con il tipo di dato ricorsivo Fun.

data Fun = X
         | Con Int
         | Fun :+: Fun
         | Fun :*: Fun
         | Fun :-: Fun
         | Fun :^: Int

-- Si possono ridefinire tipi come Show, per visualizzare le funzioni.

instance Show Fun where
  show = auxU
    where
      auxU X = "x"
      auxU (Con n) = show n
      auxU (f :+: g) = auxG 2 f ++ " + " ++ auxG 2 g
      auxU (f :-: g) = auxG 2 f ++ " - " ++ auxG 2 g
      auxU (f :*: g) = auxG 3 f ++ " * " ++ auxG 3 g
      auxU (f :^: n) = auxG 4 f ++ "^" ++ show n

      auxG p f@(_ :+: _) | p > 2 = parens (auxU f)
      auxG p f@(_ :-: _) | p > 2 = parens (auxU f)
      auxG p f@(_ :*: _) | p > 3 = parens (auxU f)
      auxG _ f = auxU f

      parens s = "(" ++ s ++ ")"