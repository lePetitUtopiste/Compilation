(**
   La traduction de MIMP vers AIMP réalise deux tâches principales
   - explosion des expressions en séquences d'instructions atomiques,
     en introduisant au passage des registres virtuels pour stocker les
     résultats intermédiaires des calcules
   - implémentation des conventions de passage des paramètres et résultats
     des fonctions, ainsi que des conventions de sauvegarde des registres
     physiques

   Conventions à réaliser :
   - pour la transmission des résultats : registre $v0
   - pour le passage des paramètres, AU CHOIX
     * soit tout sur la pile (premier paramètre au sommets, les suivante
       en progressant vers l'intérieur de la pile)
     * soit les quatre premiers dans les $ai, puis les suivants sur la
       pile
   - lors d'un appel de fonction, l'appelant doit gérer la sauvegarde des
     registres $ti, $ai et $v0, et l'appelé doit gérer la sauvegarde des
     registres $si

   La création des registres virtuels est faite indépendamment pour chaque
   fonction. Dans une fonction donnée, les registres virtuels sont vus
   comme des variables locales.
 *)

open Aimp

(* Traduction directe *)
let tr_unop = function
  | Mimp.Addi n -> Addi n
let tr_binop = function
  | Mimp.Add -> Add
  | Mimp.Mul -> Mul
  | Mimp.Lt  -> Lt

(* Fonction principale, de traduction d'une définition de fonction *)
let tr_fdef fdef =
  (* Liste des registres virtuels. Elle est initialisée avec les variables
     locales et sera étendue à chaque création d'un nouveau registre
     virtuel. *)
  let vregs = ref Mimp.(fdef.locals) in
  (* Fonction de génération de nouveaux registres virtuels.
     Renvoie le nouveau nom, et étend la liste. *)
  let counter = ref 0 in
  let new_vreg () =
    let name = Printf.sprintf "#%i" !counter in
    vregs := name :: !vregs;
    incr counter;
    name
  in

  (* Fonction de traduction des expressions.
     Renvoie une paire (r, s) d'une séquence s et du nom r du registre
     virtuel contenant la valeur de l'expression. *)
  let rec tr_expr = function
    | Mimp.Cst n ->
       let r = new_vreg() in r, Nop ++ Cst(r, n)
    | Mimp.Bool b ->
       let r = new_vreg() in
       let n = if b then 1 else 0 in
       r, Nop ++ Cst(r, n)
    | Mimp.Var x ->
       (* Il faut distinguer ici entre variables locales, paramètres et
          variables globales. *)
       (*si la variable est une variable locale ou un paramètre, on la stocke dans un registre virtuel
         si la variable est supposé aller sur la pile on ne fait rien et on renvoie NOP*)

       if List.mem x Mimp.(fdef.locals)  then
        x , Nop
       else
        let r = new_vreg() in
        r, Nop ++ Read(r,x)

    | Mimp.Unop(op, e) ->
       let r1, s1 = tr_expr e in
       let r = new_vreg() in
       r, s1 ++ Unop(r, tr_unop op, r1)
    | Mimp.Binop(op, e1, e2) ->
       let r1, s1 = tr_expr e1 in
       let r2, s2 = tr_expr e2 in
       let r = new_vreg() in
       r, s1 @@ s2 ++ Binop(r, tr_binop op, r1, r2)
    | Mimp.Call(f, args) ->
       (* Il faut réaliser ici la convention d'appel : passer les arguments
          de la bonne manière, et renvoyer le résultat dans $v0. *)


      let rec parcours_args args cpt =
        match args with
        (*parcours la liste des paramètres, place les 3 premiers dans $a1-3 et le reste dans la pile*)
        |e::suite -> if (cpt >=3) then let r,s = tr_expr e in  (parcours_args suite (cpt + 1)) @@ (s @@ (Nop ++ Push(r)))
                                   else  let r,s = tr_expr e in  (parcours_args suite (cpt + 1)) @@ (s @@ (Nop ++ Move(("$a"^(string_of_int (cpt+1))),r)))
        | _ -> Nop
      in
      let s = parcours_args args 0 in
      (*gestion des caller-saved*)
      (* let s1 = Nop ++ Aimp.Push("$t2") ++ Aimp.Push("$t3") ++ Aimp.Push("$t4") ++ Aimp.Push("$t5") ++ Aimp.Push("$t6") ++ Aimp.Push("$t7") in
      let s2 = Nop ++ Pop(1) ++ Read("$t7","$sp") ++ Pop(1) ++ Read("$t6","$sp") ++ Pop(1) ++ Read("$t5","$sp") ++ Pop(1) ++ Read("$t4","$sp")++ Pop(1)
               ++ Read("$t3","$sp") ++ Pop(1) ++ Read("$t2","$sp") in *)

      (*passage des paramètres $a[1-3] dans $s[5-7] pour assurer leurs conservations
      au retour de l'appel*)
      "$v0",  (Nop ++ Move("$s5","$a1") ++ Move("$s6","$a2") ++ Move("$s7","$a3"))
              @@  ( s ++ Call(f,List.length args) ++ Pop( max ((List.length args)-3) 0  ))
              @@ (Nop ++ Move("$a1","$s5") ++ Move("$a2","$s6") ++ Move("$a3","$s7"))
              (*récupération des paramètres depuis $s[5-7]*)

  in

  let rec tr_instr = function
    | Mimp.Putchar e ->
       let r, s = tr_expr e in
       s ++ Putchar r
    | Mimp.Set(x, e) ->
       let r,s = tr_expr e in
       s ++ Write(x,r)
    | Mimp.If(e, s1, s2) ->
       let r, s = tr_expr e in
       s ++ If(r,tr_seq s1,tr_seq s2)
    | Mimp.While(e, s) ->
       let r_test, s_test = tr_expr e in
       Nop ++ While(s_test, r_test, tr_seq s)

    | Mimp.Return e ->
       (* Le résultat renvoyé doit être placé dans $v0. *)
       let r,s = tr_expr e in
       s ++ Move("$v0",r) ++ Return

    | Mimp.Expr e ->
       let r, s = tr_expr e in
       s
  and tr_seq = function
    | []     -> Nop
    | i :: s -> tr_instr i @@ tr_seq s
  in

  let code =
  tr_seq Mimp.(fdef.code)
  in
  {
    name = Mimp.(fdef.name);
    params = Mimp.(fdef.params);
    locals = !vregs;
    code = code
  }

(* Traduction directe *)
let tr_prog p = {
    globals = Mimp.(p.globals);
    functions = List.map tr_fdef Mimp.(p.functions)
  }
