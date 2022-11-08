open Eimp
open Mips

let new_label =
  let count = ref 0 in
  fun () -> incr count; Printf.sprintf "__lab_%i" !count

let tr_fdef fdef =

  let return_label = new_label() in

  let rec tr_instr = function
    | Putchar r          -> move a0 r @@ li v0 11 @@ syscall
    | Read(rd, Global x) -> failwith "not implemented"
    | Read(rd, Stack i)  -> failwith "not implemented"
    | Write(Global x, r) -> failwith "not implemented"
    | Write(Stack i, r)  -> failwith "not implemented"
    | Move(rd, r)        -> failwith "not implemented"
    | Push r             -> sw r 0 sp @@ subi sp sp 4
    | Pop n              -> addi sp sp (4*n)
    | Cst(rd, n)         -> li rd n
    | Unop(rd, Addi n, r)    -> addi rd r n
    | Binop(rd, Add, r1, r2) -> failwith "not implemented"
    | Binop(rd, Mul, r1, r2) -> failwith "not implemented"
    | Binop(rd, Lt, r1, r2)  -> failwith "not implemented"
    | Call(f)            -> failwith "not implemented"
    | If(r, s1, s2) ->
       failwith "not implemented"
    | While(s1, r, s2) ->
       failwith "not implemented"
    | Return -> failwith "not implemented"

  and tr_seq (s: Eimp.sequence) = match s with
    | Nop         -> nop
    | Instr i     -> tr_instr i
    | Seq(s1, s2) -> tr_seq s1 @@ tr_seq s2
  in

  (* code de la fonction *)
  failwith "not implemented"


let tr_prog prog =
  let init =
    beqz a0 "init_end"
    @@ lw a0 0 a1
    @@ jal "atoi"
    @@ label "init_end"
    @@ move a0 v0
    (* @@ sw v0 0 sp
     * @@ subi sp sp 4 *)
    @@ jal "main"
    (* Après l'exécution de la fonction "main", appel système de fin de
       l'exécution. *)
    @@ li v0 10
    @@ syscall
  and built_ins =
    (* Fonction de conversion chaîne -> entier, à base d'une boucle sur les
       caractères de la chaîne. *)
    comment "built-in atoi"
    @@ label "atoi"
    @@ li   v0 0
    @@ label "atoi_loop"
    @@ lbu  t0 0 a0
    @@ beqz t0 "atoi_end"
    @@ addi t0 t0 (-48)
    @@ bltz t0 "atoi_error"
    @@ bgei t0 10 "atoi_error"
    @@ muli v0 v0 10
    @@ add  v0 v0 t0
    @@ addi a0 a0 1
    @@ b "atoi_loop"
    @@ label "atoi_error"
    @@ li   v0 10
    @@ syscall
    @@ label "atoi_end"
    @@ jr   ra
  in

  (**
     Code principal pour générer le code MIPS associé au programme source.
   *)
  let function_codes = List.fold_right
    (fun fdef code ->
      label fdef.name @@ tr_fdef fdef @@ code)
    prog.functions nop
  in
  let text = init @@ function_codes @@ built_ins
  and data = List.fold_right
    (fun id code -> label id @@ dword [0] @@ code)
    prog.globals nop
  in
  
  { text; data }
  
