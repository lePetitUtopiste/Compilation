open Aimp
open Graph

module VSet = Set.Make(String)

let liveness fdef =
  let liveness = Hashtbl.create 64 in

  (*sequence s out ->
    en supposant que les variables vivantes en sortie de [s] sont données par
    [out], calcul et renvoie les variables vivantes en entrée de [s]
    NOTE : effet de bord: met à jours les tables liveness pour toutes les
                          instructions vues lors du calcul
  *)
  let rec sequence s out = match s with
    | Nop -> out
    | Instr(n, i) ->
       Hashtbl.replace liveness n out;
       instr i out
    | Seq(s1, s2) ->
       sequence s1 (sequence s2 out)
    (*instr i out ->
    en supposant que les variables vivantes en sortie de [i] sont données par
    [out], calcul et renvoie les variables vivantes en entrée de [i]
    NOTE : effet de bord : met à jours les tables liveness pour toutes les
                           instructions vues lors du calcul
    *)
  and instr i out = match i with
    | Putchar r ->
    (* Attention : réaliser putchar en MIPS nécessite d'écrire dans les
       registres réels $a0 et $v0. *)
       let out1 = VSet.remove "&a0" out in
       let out1 = VSet.remove "$v0" out1 in
       VSet.add r out1
    | Write(_, r) ->
       VSet.add r out
    | Read(rd, _) | Cst(rd, _) ->
       VSet.remove rd out
    | Move(rd, r) | Unop(rd, _, r) ->
       let out1 = VSet.remove rd out in
       VSet.add r out1
    | Binop(rd, _, r1, r2) ->
       let out1 = VSet.remove rd out in
       let out2 = VSet.add r1 out1 in
       VSet.add r2 out2
    | Push r ->
       VSet.add r out
    | Pop _ ->
       out
    | Call(_, n) ->
       (*les registres callee saved sont considéré comme écrit et ne sont donc plus vivant en sorti*)
       let out1 = VSet.remove "$a0" out in
       let out1 = VSet.remove "$a1" out1 in
       let out1 = VSet.remove "$a2" out1 in
       let out1 = VSet.remove "$a3" out1 in

       let out1 = VSet.remove "$t2" out1 in
       let out1 = VSet.remove "$t3" out1 in
       let out1 = VSet.remove "$t4" out1 in
       let out1 = VSet.remove "$t5" out1 in
       let out1 = VSet.remove "$t6" out1 in
       let out1 = VSet.remove "$t7" out1 in
       let out1 = VSet.remove "$t8" out1 in
       let out1 = VSet.remove "$t9" out1 in

       VSet.remove "$v0" out1

       (*on cosidère les paramètres lu on va donc considéré les registre *)
    | Return ->
       let out1 = VSet.add "v0" out in
       let out1 = VSet.add "$s0" out1 in
       let out1 = VSet.add "$s1" out1 in
       let out1 = VSet.add "$s2" out1 in
       let out1 = VSet.add "$s3" out1 in
       let out1 = VSet.add "$s4" out1 in
       let out1 = VSet.add "$s5" out1 in
       let out1 = VSet.add "$s6" out1 in
       let out1 = VSet.add "$s7" out1 in
       VSet.add "$s8" out1

    | If(r, s1, s2) ->
       let inS1 = sequence s1 out in
       let inS2 = sequence s2 out in
       let outTest = VSet.union inS1 inS2 in
       VSet.add r outTest
    | While(st, r, s) ->
       let live_in_body = sequence s out in (*vivant en entrée du bloc*)
       let live_in_test = sequence st (VSet.add r live_in_body) in (*vivant en entrée di test*)
       let live_in_body = sequence s live_in_test in
       sequence st (VSet.add r live_in_body)
  in

  ignore(sequence fdef.code VSet.empty);
  (* Si le résultat précédent n'est pas VSet.empty, on a risque d'accès à
     des variables non initialisées. *)
  liveness


type register =
  | Actual  of string
  | Stacked of int

let v0 = "$v0"

let interference_graph fdef =
  let live_out = liveness fdef in
  let g = List.fold_left (fun g x -> Graph.add_vertex x g) Graph.empty fdef.locals in
  (*fonction de parcours des séquences*)
  let rec seq s g = match s with
    | Nop -> g
    | Instr(n, i) -> instr n i g
    | Seq(s1, s2) -> seq s1 (seq s2 g)
   (*fonction de parcours des *)
  and instr n i g = match i with
    | Read(rd, _) | Cst(rd, _) | Unop(rd, _, _) | Binop(rd, _, _, _) ->
       (*ajouter à g une arrête entre rd et chaque registre virtuel vivant en sortie*)
       let out = Hashtbl.find live_out n in
       VSet.fold (fun r g' -> if r <> rd then
                                Graph.add_edge r rd Conflict g'
                              else g')
                 out
                 g
    | If(_, s1, s2) ->
      (*TODO*)
      let g1 = seq s1 g in
      seq s2 g1
    | While(s1, _, s2) ->
       seq s2 (seq s1 g)
    | Move(rd, rs) ->
        (*pour l'instant on ne gère pas les liens de préférences*)
        let out = Hashtbl.find live_out n in
        VSet.fold (fun r g' -> if r <> rd && r <> rs  then
                                 Graph.add_edge r rd Conflict g'
                               else g')
                 out
                 g
    | Putchar _ | Write _ | Return | Push _ | Pop _ ->
       g (*certain que c'est faux TODO corriger ce truc*)
    | Call(_, _) ->
    let out = Hashtbl.find live_out n in
    VSet.fold (fun r g' -> if r <> "$v0" then
                             Graph.add_edge r "$v0" Conflict g'
                           else g')
                 out
                 g
  in
  seq fdef.code g


type color = int VMap.t


(* Renvoie la plus petit couleur non utilisée par l'ensemble [v]. *)
let choose_color v colors =
  let val_max = VSet.fold (fun elt cpt_max -> if colors[elt] <= cpt_max then cpt_max else colors[elt]) v 0 in
  val_max + 1
let color g k =

  let george x y g =
    failwith "not implemented"
  in

  let rec simplify g =
    failwith "not implemented"

  and coalesce g =
    failwith "not implemented"

  and freeze g =
    failwith "not implemented"

  and spill g =
    failwith "not implemented"

  and select x g =
    failwith "not implemented"

  in
  simplify g

let print_colors c =
  Printf.(printf "Coloration : \n";
          VMap.iter (printf "  %s: %i\n") c)

(**
   4/ Conclusion
   Les couleurs sont des numéros. Les numéros de 0 à K-1 sont associés
   aux K registres physiques utilisés, et les numéros suivants à des
   emplacements dans la pile.
 *)

let allocation (fdef: function_def): register Graph.VMap.t * int =
  (* Calculer les vivacités, en déduire un graphe d'interférence,
     le colorier, puis en déduire :
     - une affectation concrète de chaque sommet à un registre réel
       ou un emplacement de pile,
     - le nombre d'emplacements de pile utilisés.
   *)
  failwith "not implemented"
