type expression =
  | Cst   of int
  | Bool  of bool
  | Var   of string
  | Unop  of Ops.unop * expression
  | Binop of Ops.binop * expression * expression
  | Call  of string * expression list
  (* Pointeurs *)
  | Deref of expression (*lecture adresse mémoire *)
  | Addr  of string (* & -> adresse d'une variable, utilisé ici pour obtenir
                       in pointeur de code sur une fonction *)
  | PCall of expression * expression list (*appel de fonction par pointeur *)
  | Sbrk  of expression (* primitive d'allocation dans le tas *)

type instruction =
  | Putchar of expression
  | Set     of string * expression
  | If      of expression * sequence * sequence
  | While   of expression * sequence
  | Return  of expression
  (* Pointeurs *)
  | Write   of expression * expression (*écriture à l'adresse mémoire *)
  | Expr    of expression

and sequence = instruction list

(*primitives pour créer un tableau est accéder à un tableau*)
let array_access (t: expression) (i: expression): expression =
  Binop(Ops.Add, t, Binop(Ops.Mul, i, Cst 4))
let array_get (t: expression) (i: expression): expression =
  Deref(array_access t i)
let array_set (t: expression) (i: expression) (e: expression): instruction =
  Write(array_access t i, e)
let array_create (n: expression): expression =
  Call("malloc", [Binop(Mul, n, Cst 4)])

type function_def = {
  name: string;
  code: sequence;
  params: string list;
  locals: string list;
}

type program = {
  main: sequence;
  functions: function_def list;
  globals: string list;
}

let merge lib prog = {
  main = lib.main @ prog.main;
  functions = lib.functions @ prog.functions;
  globals = lib.globals @ prog.globals;
}
