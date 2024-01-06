(** Sia data una definizione induttiva di numero 
naturale unario [naturale] *)

Inductive naturale : Set :=
| Zero : naturale
| Succ : naturale -> naturale .

(** Domanda 1 *)
(** Definire una funzione [meno] *)
Fixpoint meno (x y : naturale) : naturale :=
match x , y with
| Zero   , _    => Zero
| x      , Zero => x
| Succ x , Succ y    => meno x y
end.

Example menos :
meno (Zero) (Succ Zero) = (Zero).
Proof.
auto.
Qed.

(** Domanda 2 *)
(** Definire un tipo induttivo adatto a caratterizzare
la struttura degli elementi nel grafo di [meno] *)
Inductive meno_graph : naturale -> naturale -> naturale -> Prop :=
| Meno_Zero : forall n : naturale, meno_graph Zero n    Zero
| Meno_N    : forall n : naturale, meno_graph n    Zero n
| Meno_Succ : forall x y z : naturale,
   meno_graph x y z 
   -> meno_graph (Succ x) (Succ y) z.

(** Domanda 3 *)
(** Dimostrare che la definizione di [meno] è corretta 
rispetto alla definizione di [meno_graph] *)
Proposition meno_corretto : forall (p q : naturale),
    meno_graph p q (meno p q).
Proof.
  intros p. induction p as [ | p' IH].
  - intros q. destruct q.
    + apply Meno_Zero.
    + simpl. apply Meno_Zero.
  - intros q. simpl. destruct q.
    + apply Meno_N.
    + apply Meno_Succ. apply IH.
Qed.

