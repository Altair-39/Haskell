(** Sia data una definizione induttiva di numero 
naturale unario [naturale] *)

Inductive naturale : Set :=
| Zero : naturale
| Succ : naturale -> naturale .

(** Domanda 1 *)
(** Definire una funzione [meno] *)
Fixpoint meno ...

(** Domanda 2 *)
(** Definire un tipo induttivo adatto a caratterizzare
la struttura degli elementi nel grafo di [meno] *)
Inductive meno_rel ...

(** Domanda 3 *)
(** Dimostrare che la definizione di [meno] è corretta 
rispetto alla definizione di [meno_graph] *)
Proposition meno_corretto ...