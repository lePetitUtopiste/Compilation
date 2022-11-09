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
       let out1 = Vset.remove "$a0" out in
       let out1 = Vset.remove "$a1" out1 in
       let out1 = Vset.remove "$a2" out1 in
       let out1 = Vset.remove "$a3" out1 in

       let out1 = Vset.remove "$t2" out1 in
       let out1 = Vset.remove "$t3" out1 in
       let out1 = Vset.remove "$t4" out1 in
       let out1 = Vset.remove "$t5" out1 in
       let out1 = Vset.remove "$t6" out1 in
       let out1 = Vset.remove "$t7" out1 in
       let out1 = Vset.remove "$t8" out1 in
       let out1 = Vset.remove "$t9" out1 in

       let out1 = Vset.remove "$v0" out1 in

       (*on cosidère les paramètres lu on va donc considéré les registre *)
    | Return ->
       VSet.add "v0" out

       let out1 = Vset.add "$s0" out1 in
       let out1 = Vset.add "$s1" out1 in
       let out1 = Vset.add "$s2" out1 in
       let out1 = Vset.add "$s3" out1 in
       let out1 = Vset.add "$s4" out1 in
       let out1 = Vset.add "$s5" out1 in
       let out1 = Vset.add "$s6" out1 in
       let out1 = Vset.add "$s7" out1 in
       let out1 = Vset.add "$s8" out1 in

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
  let rec seq s g = match s with
    | Nop -> g
    | Instr(n, i) -> instr n i g
    | Seq(s1, s2) -> seq s1 (seq s2 g)
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
       g (*pour l'instant on ne gère pas les lien de préférence*)
    | Putchar _ | Write _ | Return | Push _ | Pop _ ->
       g (*certain que c'est faut TODO corriger ce truc*)
    | Call(_, _) ->
       g (*TODO pareil*)
  in
  seq fdef.code g


type color = int VMap.t


(* Renvoie la plus petit couleur non utilisée par l'ensemble [v]. *)
let choose_color v colors =
  failwith "not implemented"

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

let allocation (fdef: function_def): register Graph.VMap.t * int =
  failwith "not implemented"
