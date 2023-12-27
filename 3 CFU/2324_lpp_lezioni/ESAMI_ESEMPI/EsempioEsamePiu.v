(** Sia data una definizione induttiva di numero 
naturale unario [naturale] *)

Inductive naturale : Set :=
| Zero : naturale
| Succ : naturale -> naturale .

(** Domanda 1 *)
(** Definire una funzione somma *)
Fixpoint piu ...

(** Domanda 2 *)
(** Definire un tipo induttivo adatto a caratterizzare
la struttura degli elementi nel grafo di [piu] *)
Inductive piu_rel ...

(** Domanda 3 *)
(** Dimostrare che la definizione di [piu] è corretta 
rispetto alla definizione di [piu_graph] *)
Proposition piu_corretto ...
