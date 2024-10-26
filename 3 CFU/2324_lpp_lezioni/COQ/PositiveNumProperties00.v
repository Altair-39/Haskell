From LPP Require Import PositiveNum.
From LPP Require Import PositiveNumVsInteger.

Module PositiveNumProperties00.

(*************)
(** * INDICE *)
(** Le prime due sezioni contengono una carrellata di
proprietà che offrono l'occasione di introdurre un
insieme rilevante di tattiche.

  - intro, intros
  - reflexivity
  - destruct, destruc ... as (... , ... )
  - simpl, simpl in
  - inversion
  - unfold, unfold in
  - fold, fold in
  - rewrite, rewrite <-
  - inducion

L'ultima sezione offre alcuni esercizi.
*)

(*********************************************** *)
(** ** Proprietà di [succ] relative a [Positive] *)

Lemma xI_succ_xO: forall (p: PositiveNum.Positive),
  PositiveNum.XI p = PositiveNum.succ (PositiveNum.XO p).
Proof.
simpl. reflexivity.
Qed. 
(* Admitted. *)

(** Per casi. 
    - [discriminate]: elimina goal che dipendono da assunzioni
    palesemente false, grazie al fatto che costruttori diversi
    generano elementi diversi, qundi è impossibile che siani
    uguali
    - [inversion]: come [discriminate], ma può produrre nuove
    assunzioni, più essenziali, da cui può dipendere il goal
    da dimostrare.
*)
Lemma succ_discr: forall (p: PositiveNum.Positive),
  p <> PositiveNum.succ p.
Proof. 
destruct p as [ p' | p'' | ].
- simpl. unfold not. discriminate. 
- intros eq. inversion eq.
- discriminate.
Qed.
(* Admitted. *)


(** *** Esempi paradigmatici di uso della tattica [inversion] *)
Inductive day : Type :=
  | monday
  | tuesday
  | wednesday .

(** **** Giorni della settimana *)
Definition next_weekday (d:day) : day :=
  match d with
  | monday => tuesday
  | tuesday => wednesday
  | wednesday => monday
  end.

(** Per casi.
    - Ricordare che [x <> y] è [not (x = y)], cioè [x = y -> False].
    Quindi, di fronte a [x <> y] può servire [unfold not].
    - utile [inversion].
    *)
Theorem next_weekday_not_same : forall (d: day),
  next_weekday d <> d.
Proof. 
destruct d ; intros nxt ; inversion nxt. 
Qed. 
(* Admitted. *)

(** - [inversion] per semplificare una assunzione secondo la quale
    due termini ottenuti applicando un successore [S] sono identici.
    - Ragionamento forward tramite [apply] usata su assunzione
*)
Theorem not_eq_SnSm_nm : forall n m : nat,
  S n = S m -> n <> m -> False.
Proof. (* forward *)
intros m n Heq Hneq.
inversion Heq as [ip].
unfold not in Hneq.
apply Hneq in ip.
assumption.
Qed.

(* Backward reasoning 
Proof.
intros m n.
intros Heq Hneq.
inversion Heq.
unfold not in Hneq.
apply  Hneq.
rewrite <- H0.
reflexivity.
Qed. *)
(* Admitted. *)

(** - [destruct] per scomporre la congiunzione in un'assunzione 
    - [genaralize] per ricondursi a [not_eq_SnSm_nm] *)
Theorem not_eq_with_and : forall n m : nat,
  S n = S m /\ n <> m -> False.
Proof.
intros.
destruct H as (Hl, Hr).
generalize Hr. generalize Hl.
apply not_eq_SnSm_nm.
Qed.
(* Admitted. *)


(*********************************** *)
(** ** La funzione [succ] e "doppio" *)
(** Lo scopo di questa sezione è introdurre la
    tattica che serve per ragionare induttivamente
    sulle strutture [Inductive]
*)

(** *** Predecessore del doppio di [x] ([x -> 2*x-1]) *)
Fixpoint pred_of_double (p: PositiveNum.Positive) :=
  match p with
    | PositiveNum.XI p' => PositiveNum.XI (PositiveNum.XO p')
    | PositiveNum.XO p' => PositiveNum.XI (pred_of_double p')
    |    PositiveNum.XH => PositiveNum.XH
  end.

(** - [induction]
    - [rewrite] ipotesi induttiva 
    - [unfold]                      *)
Lemma pred_double_specification: forall (p: PositiveNum.Positive),
  pred_of_double p = PositiveNum.pred (PositiveNum.XO p).
Proof.
  induction p as [ p' IH | p' IH | ].
  3: { simpl. reflexivity. }
  - simpl. reflexivity.
  - unfold pred_of_double. fold pred_of_double. 
    rewrite IH. unfold PositiveNum.pred. 
    fold PositiveNum.pred. 
    reflexivity.
Qed.
(* 

Proof.
induction p as [ p' IH | p' IH | ].
3: { simpl. reflexivity. }
- simpl. reflexivity.
- simpl. rewrite IH. simpl. reflexivity.
Qed. *)
(* Admitted. *)

(******************** *)
(** ** ESERCIZI       *)

(** Suggerimento. Evitare l'induzione se non necessaria. *)

Lemma succ_pred_of_double: forall (p: PositiveNum.Positive),
  PositiveNum.succ (pred_of_double p) = PositiveNum.XO p.
Proof.
induction p. 
- simpl. reflexivity.
- simpl. rewrite IHp. reflexivity. 
- simpl. reflexivity.
Qed.

Lemma pred_of_double_succ: forall (p: PositiveNum.Positive), 
  pred_of_double (PositiveNum.succ p) = PositiveNum.XI p.
Proof.
  induction p as [ p' IH | p' IH | ].
  3 : { simpl. reflexivity. }
  - simpl. rewrite IH. reflexivity.
  - simpl. reflexivity.
Qed.

Lemma double_of_succ: forall (p: PositiveNum.Positive),
  PositiveNum.XO (PositiveNum.succ p) 
    = PositiveNum.succ (PositiveNum.succ (PositiveNum.XO p)).
Proof.
  induction p as [ p' IH | p' IH | ].
  3 : { simpl. reflexivity. }
  - simpl. reflexivity.
  - unfold PositiveNum.succ. reflexivity.
Qed.

Lemma pred_of_double_XO_discr: forall (p: PositiveNum.Positive),
  pred_of_double p <> PositiveNum.XO p.
Proof.
  unfold not ; destruct p ; simpl ; discriminate.
Qed.

Lemma succ_not_XH: forall (p: PositiveNum.Positive),
  PositiveNum.succ p <> PositiveNum.XH.
Proof.
  unfold not ; destruct p ; simpl ; discriminate.
Qed.
(** [] *)

End PositiveNumProperties00.
