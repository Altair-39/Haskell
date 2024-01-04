(** * Correttezza tramite relazioni *)

(** ** PREMESSA *)
(** Questo sorgente è autocontenuto: definizioni
che possiamo trovare in [PositiveNum.v] sono 
ripetute qui per comodità.
*)

(** ** OBIETTIVO  *)
(** Illustrare una tecnica per fornire un livello
di confidenza maggiore sulla correttezza della
definizione di funzioni.
*)

(** ** METODO *)
(** Ogni funzione [f] scritta in Gallina, linguaggio
di programmazione di Coq, descrive una procedura
effettiva per trasformare istanze degli argomenti in 
un risultato.

Ad esempio, se [f] è unaria, [f] costruisce ogni
coppia [(n, f n)] del grafo di [f].

Il grafo di una funzione [f] può esser rappresentato
in Coq da un tipo induttivo, diciamo [f_rel], la cui
struttura può affermare se una tupla appartiene al 
grafo di [f], oppure no.

Illustriamo il metodo, usando [Positive].
*)


(** ** [Positive] e operazioni *)

Inductive Positive: Set :=
| XI : Positive -> Positive
| XO : Positive -> Positive
| XH : Positive .

Fixpoint succ (p: Positive) : Positive :=
match p with
| XH   => XO XH
| XO b => XI b
| XI b => XO (succ b)
end. 

Fixpoint add (p p': Positive) : Positive :=
match p, p' with
| XH,     XH     => XO XH
| XH,     (XO n) => XI n
| XH,     (XI n) => XO (succ n)
| (XO m), XH     => XI m
| (XI m), XH     => XO (succ m)
| (XO m), (XO n) => XO (add m n)
| (XO m), (XI n) => XI (add m n)
| (XI m), (XI n) => XO (succ (add m n))
| (XI m), (XO n) => XI (add m n)
end.

Fixpoint pred (p: Positive) : Positive :=
match p with  
| XH     => XH
| XO XH  => XH
| XI p'  => XO p'
| XO p'  => XI (pred p')
end.


Inductive pred_graph : Positive -> Positive -> Prop :=
| pred_graph_H  : pred_graph XH XH
| pred_graph_OH : pred_graph (XO XH) XH
| pred_graph_I : forall (p: Positive), 
      pred_graph (XI p) (XO p)
| pred_graph_O : forall p r,
     pred_graph p r -> 
      pred_graph (XO p) (XI r)
.

(** Siccome ogni istanza di [pred_graph] è un 
predicato, possiamo verificare la sua verità, cioè
se descive coppie [(n,m)] col significato inteso:
[m] è sempre l'immagine di [pred n].
*)
Theorem pred_correct : forall p,
   pred_graph p (pred p).
Proof.
  induction p.
    3 : { unfold pred. apply pred_graph_H. }
    - unfold pred. apply pred_graph_I.
    - destruct p as [ p'' | p'' | ].
      + apply pred_graph_O. apply IHp.
      + apply pred_graph_O. apply IHp.
      + apply pred_graph_OH.
Qed.

(* Proof. 
   induction p as [ p' IH | p' IH | ].        
   - simpl. apply pred_graph_I. 
   - simpl. 
     destruct p' as [ p'' | p'' | ].
     + apply pred_graph_O. assumption.
     + apply pred_graph_O. assumption.
     + apply pred_graph_OH.
   - simpl. apply pred_graph_H.
   Qed. *)




(** ** ESERCIZI *)

(** *** Correttezza di [succ] *)
(** **** Definire la struttura del grafo di [succ] *)
Inductive succ_graph : Positive -> Positive -> Prop :=
| succ_graph_XH : succ_graph XH (XO XH)
| succ_graph_XO : forall (n : Positive),
                  succ_graph (XO n) (XI n)
| succ_graph_XI : forall n r,
                  succ_graph n r ->
                  succ_graph (XI n) (XO r).


(** **** Dimostrare la correttezza di [succ] rispetto al grafo *)
Theorem succ_correct: forall p,
   succ_graph p (succ p).
Proof.
  induction p.
  3 : { unfold succ. apply succ_graph_XH. }
  - simpl. apply succ_graph_XI. assumption.
  - simpl. apply succ_graph_XO.
Qed.

(** *** Correttezza di [add] *)
(** **** Definire la struttura del grafo di [add] *)
Inductive add_graph : Positive -> Positive -> Positive -> Prop :=
| add_graph_HH : add_graph XH XH (XO XH)
| add_graph_HO : forall n, add_graph XH (XO n) (XI n)
| add_graph_HI : forall n r, succ_graph n r 
                  -> add_graph XH (XI n) (XO r)
| add_graph_OH : forall n, add_graph (XO n) XH (XI n)
| add_graph_IH : forall n r, succ_graph n r 
                  -> add_graph (XI n) XH (XO r)
| add_graph_OO : forall n m r, add_graph n m r 
                  -> add_graph (XO n) (XO m) (XO r)
| add_graph_OI : forall n m r, add_graph n m r 
                  -> add_graph (XO n) (XI m) (XI r)
| add_graph_II : forall n m r r', add_graph n m r 
                  -> succ_graph m r' 
                  -> add_graph (XI n) (XI m) (XO r')
| add_graph_IO : forall n m r, add_graph n m r 
                  -> add_graph (XI n) (XO m) (XI r).


(** **** Dimostrare la correttezza di [add] rispetto al grafo *)
Theorem add_correct: forall (m n: Positive),
  add_graph m n (add m n).
Proof. 
  induction m.
    - induction n.
      + simpl. apply (add_graph_II m n (add m n)).
        * apply IHm.
        * apply succ_correct.
      +
      +





























































(* induzione sul 1mo argomento *)
...
- (* per casi sul 2do argomento *)
  ...
  + simpl.
    (* Check (add_graph_II m' n'). *)
    (* Check (add_graph_II m' n' (add m' n')). *)
    apply (add_graph_II m' n' (add m' n')).
    * apply IH. 
    * apply succ_correct.
  + ...
  + ...

- (* per casi sul 2do argomento *)
  ...
  + ...
  + ...
  + ...

- (* per casi sul 2do argomento *)
  ...
  + ...
    apply succ_correct.
  + ...
  + ...
Qed.