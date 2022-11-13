open Eimp
open Mips



let new_label =
  let count = ref 0 in
  fun () -> incr count; Printf.sprintf "__lab_%i" !count

let tr_fdef fdef =

  let return_label = new_label() in

  let rec tr_instr = function
    | Putchar r          -> move a0 r @@ li v0 11 @@ syscall
    | Read(rd, Global x) -> la rd x @@ lw rd 0(rd)
    | Read(rd, Stack i)  -> lw rd (i) fp
    | Write(Global x, r) -> la t1 x @@ sw r 0 t1
    | Write(Stack i, r)  -> sw r (i) fp
    | Move(rd, r)        -> move rd r
    | Push r             -> sw r 0 sp @@ subi sp sp 4
    | Pop n              -> addi sp sp (4*n)
    | Cst(rd, n)         -> li rd n
    | Unop(rd, Addi n, r)    -> addi rd r n
    | Binop(rd, Add, r1, r2) -> add rd r1 r2
    | Binop(rd, Mul, r1, r2) -> mul rd r1 r2
    | Binop(rd, Lt, r1, r2)  -> slt rd r1 r2
    | Call(f)            ->  jal f
    | If(r, s1, s2) ->
       let then_label = new_label() in
       let end_label = new_label() in
       bnez r then_label @@ tr_seq s2 @@ b end_label @@ label then_label @@ tr_seq s1 @@ label end_label

    | While(s1, r, s2) ->
       let test_label = new_label() in
       let code_label = new_label() in
        b test_label
        @@ label code_label
        @@ tr_seq s2
        @@ label test_label
        @@ tr_seq s1
        @@ bnez r code_label

    | Return ->
      move sp fp
      @@ lw ra (-4) fp
      @@ lw fp 0 fp
      @@ jr ra

  and tr_seq (s: Eimp.sequence) = match s with
    | Nop         -> nop
    | Instr i     -> tr_instr i
    | Seq(s1, s2) -> tr_seq s1 @@ tr_seq s2
  in

  (* code de la fonction *)
  sw fp 0 sp  (*sauvegarde de fp a la place pointé par sp*)
  @@ subi sp sp 4 (*on déplace sp à la case inférieure *)
  @@ sw ra 0 sp (*sauvegarde de l'adresse de retour*)
  @@ subi sp sp 4 (*déplacement de la case*)
  @@ addi fp sp 8 (*on décale le début du pointeur de fonction au dessus de ces deux valeurs*)
  @@ addi sp sp (-4 * fdef.locals) (*on place sp à la fin de la liste des variables locales*)
  @@ tr_seq (fdef.code) (*on ajoute le code la fonction*)
  (*code en cas d'abscence du return*)
  @@ li "$v0" 0  (*on remet $v0 à 0*)
  @@ move sp fp (*on désalloue la pile*)
  @@ lw ra (-4) fp (*on remet le ra précédent dans ra *)
  @@ lw fp 0 fp
  @@ jr ra (*on retourne au bout de  code de la fonction précédente*)


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
