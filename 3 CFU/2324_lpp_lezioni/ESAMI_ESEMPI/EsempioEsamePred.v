(** Sia data una definizione induttiva di numero 
naturale unario [naturale] *)

Inductive naturale : Set :=
| Zero : naturale
| Succ : naturale -> naturale .

(** Domanda 1 *)
(** Definire una funzione predecessore *)
Definition pred ...

(** Domanda 2 *)
(** Definire un tipo induttivo adatto a caratterizzare
la struttura degli elementi nel grafo di [pred] *)
Inductive pred_graph ...

(** Domanda 3 *)
(** Dimostrare che la definizione di [pred] è corretta 
rispetto alla definizione di [pred_graph] *)
Proposition pred_corretto ...