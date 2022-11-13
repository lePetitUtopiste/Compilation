open Eimp
open Register_allocation

let tr_unop = function
  | Aimp.Addi n -> Addi n
let tr_binop = function
  | Aimp.Add -> Add
  | Aimp.Mul -> Mul
  | Aimp.Lt -> Lt

let dst_reg = "$t0"
let op1_reg = "$t0"
let op2_reg = "$t1"

let tr_fdef fdef =
  let alloc, mx = allocation fdef in
  Printf.printf "fin allocation pour la fonction %s\n" fdef.name;

  let save vr = (Printf.printf "save %s\n" vr); match Graph.VMap.find vr alloc with
    | Actual r  -> Nop
    | Stacked i -> Instr(Write(Stack(i), dst_reg))
  in
  let load op vr = (Printf.printf "load %s\n" vr);match Graph.VMap.find vr alloc with
    | Actual r  -> Nop
    | Stacked i -> Instr(Read(op, Stack(i)))
  in
  let load1 = load op1_reg in
  let load2 = load op2_reg in
  let reg op vr = (Printf.printf "reg s%s\n" vr); match Graph.VMap.find vr alloc with
    | Actual r  -> r
    | Stacked i -> op
  in
  let dst = reg dst_reg in
  let op1 = reg op1_reg in
  let op2 = reg op2_reg in

  (* On utilise les registres réels quand il y en a, et à défaut $t0 et $t1. *)

  let rec tr_instr = function
    | Aimp.Putchar vr ->
       load1 vr
       @@ Instr(Putchar(op1 vr))
    | Aimp.Read(vrd, x) ->
        (*plusieurs cas si x est une variable globale ou pas*)
      let result =
        try
          match Graph.VMap.find x alloc  with
          | Stacked(i) -> Instr(Read(dst vrd,Stack(i))) @@ save vrd
          | Actual(r) ->  Instr(Move(dst vrd, r)) @@ save vrd
        with
          | Not_found -> Instr(Read(dst vrd,Global(x))) @@ save vrd
          in
          result
    | Aimp.Write(x, vr) ->
      let result =
       try
         match Graph.VMap.find x alloc with
         | Stacked(i) -> load1 vr @@ Instr(Write(Stack(i),op1 vr))
         | Actual(r) ->  load1 vr @@ Instr(Move(r,op1 vr))
       with
        | Not_found -> load1 vr @@ Instr(Write(Global(x),op1 vr))
        in
        result
    | Aimp.Move(vrd, vr) ->
        load2 vr @@ Instr(Move(dst vrd,op2 vr)) @@ save vrd
    | Aimp.Push vr ->
       load1 vr @@ Instr(Push(op1 vr))
    | Aimp.Pop n ->
       Instr(Pop(n))
    | Aimp.Cst(vrd, n) ->
       Instr(Cst(dst vrd, n))
       @@ save vrd
    | Aimp.Unop(vrd, op, vr) ->
       load1 vr
       @@ Instr(Unop(dst vrd, tr_unop op, op1 vr))
       @@ save vrd
    | Aimp.Binop(vrd, op, vr1, vr2) ->
       load1 vr1 @@ load2 vr2 @@ Instr(Binop(dst vrd, tr_binop op, op1 vr1, op2 vr2))@@ save vrd
    | Aimp.Call(f, n) ->
       Instr(Call(f))
    | Aimp.If(vr, s1, s2) ->
       load1 vr @@ Instr(If(dst vr, tr_seq s1, tr_seq s2))
    | Aimp.While(s1, vr, s2) ->
       let s1_trad = tr_seq s1 in
       Instr(While(s1_trad @@ load1 vr, op1 vr, tr_seq s2))
    | Aimp.Return ->
       Instr(Return)

  and tr_seq = function
    | Aimp.Seq(s1, s2) -> Seq(tr_seq s1, tr_seq s2)
    | Aimp.Instr(_, i) -> tr_instr i
    | Aimp.Nop         -> Nop

  in

  {
    name = Aimp.(fdef.name);
    params = List.length Aimp.(fdef.params);
    locals = mx;
    code = tr_seq Aimp.(fdef.code);
  }

let tr_prog prog = {
    globals = Aimp.(prog.globals);
    functions = List.map tr_fdef Aimp.(prog.functions);
  }
