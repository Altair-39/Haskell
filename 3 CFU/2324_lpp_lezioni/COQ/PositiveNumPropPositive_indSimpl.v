From LPP Require Import PositiveNum.
From LPP Require Import PositiveNumVsInteger.

Module PositiveNumPropPositive_indSimpl.

(*************)
(** * Principio di induzione [Positive_ind] *)
(** Per ogni tipo induttivo, coq deriva un principio
di induzione. 

Per [Positive] è:
*)

Check PositiveNum.Positive_ind.
(* ==>
Positive_ind
	: forall P : Positive -> Prop,
      (forall p : Positive, P p -> P (XI p)) ->
      (forall p : Positive, P p -> P (XO p)) ->
      P XH -> forall p : Positive, P p
*)

(** È possibile usare il principio di induzione per sviluppare
modularmente dimostrazioni per induzione. *)

(*********************************** *)
(** ** [Positive_ind], [succ] e "doppio" *)
(** Data la funzione [x -> 2*x-1] per [x:Positive]: *)
Fixpoint pred_of_double x :=
  match x with
    | PositiveNum.XI p => PositiveNum.XI (PositiveNum.XO p)
    | PositiveNum.XO p => PositiveNum.XI (pred_of_double p)
    |               XI => XI
  end.

(** ripetiamo la dimostrazione della proprietà:
    
      pred_double_spec: forall (p: Positive),
           pred_of_double p = pred (XO p).

usando [Positve_ind].
*)

Definition P_pred_double_spec (p: PositiveNum.Positive): Prop :=
  pred_of_double p 
      = PositiveNum.pred (PositiveNum.XO p).

Lemma P_pred_double_spec_I: forall (p: PositiveNum.Positive), 
  P_pred_double_spec p 
    -> P_pred_double_spec (PositiveNum.XI p).
Admitted.

Lemma P_pred_double_spec_O: forall (p: PositiveNum.Positive), 
  P_pred_double_spec p 
    -> P_pred_double_spec (PositiveNum.XO p).
Admitted.

Lemma P_pred_double_spec_H:
  P_pred_double_spec PositiveNum.XH.
Admitted.

Proposition pred_double_spec: forall (p: PositiveNum.Positive),
    P_pred_double_spec p. 
Proof.
(* Quella "vecchia": *)
(* induction p.
- simpl. reflexivity.
- simpl. rewrite IHp. simpl. reflexivity.  
- simpl. reflexivity.  *)
apply PositiveNum.Positive_ind.
- apply P_pred_double_spec_I.
- apply P_pred_double_spec_O.
- apply P_pred_double_spec_H.
Qed.

End PositiveNumPropPositive_indSimpl.
