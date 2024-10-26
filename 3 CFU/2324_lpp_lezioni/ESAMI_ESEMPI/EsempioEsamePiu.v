(** Sia data una definizione induttiva di numero 
naturale unario [naturale] *)

Inductive naturale : Set :=
| Zero : naturale
| Succ : naturale -> naturale .

(** Domanda 1 *)
(** Definire una funzione somma *)
Fixpoint piu (x y : naturale) : naturale :=
match x , y with
| Zero   , y => y
| Succ x , y => Succ (piu x y)  
end.

Example pius :
piu (Succ Zero) (Succ Zero) = Succ (Succ (Zero)).
Proof.
auto.
Qed.

(** Domanda 2 *)
(** Definire un tipo induttivo adatto a caratterizzare
la struttura degli elementi nel grafo di [piu] *)
Inductive piu_graph : naturale -> naturale -> naturale -> Prop :=
| Piugraph_Zero : forall y, piu_graph Zero y y
| Piugraph_Succ : forall x y z,
    piu_graph x y z ->
    piu_graph (Succ x) y (Succ z).


(** Domanda 3 *)
(** Dimostrare che la definizione di [piu] è corretta 
rispetto alla definizione di [piu_graph] *)
Proposition piu_corretto : forall (x y : naturale),
    piu_graph x y (piu x y).
Proof.
   intros.
   induction x as [ | x IH ].
   - simpl. apply Piugraph_Zero.
   - simpl. apply Piugraph_Succ. assumption.
Qed.
