type expression =
  | Cst   of int (*1*)
  | Bool  of bool (*true*)
  | Var   of string (* x *)
  | Unop  of Ops.unop * expression (* -e *)
  | Binop of Ops.binop * expression * expression (*e1 + e2 *)
  | Tpl   of expression list (*(e1,e2,...,eN)*)
  | TplGet of expression * int (*t[i]*)
  | Fun   of string * expression (*fun x -> e *)
  | App   of expression * expression (*e1 e2*)
  | If    of expression * expression * expression
  | LetIn of string * expression * expression (*let x = e1 in e2*)
  | LetRec of string * expression * expression

type program = expression

let rec mk_fun xs e = match xs with
  | [] -> e
  | x::xs -> Fun(x, mk_fun xs e)
