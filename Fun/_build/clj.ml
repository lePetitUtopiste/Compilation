(*différence par rapport à fun
  var est déclaré à part*)

type var =
  | Name of string
  | CVar of int (*indique la position de la var dans la cloture*)

type expression =
  | Cst   of int
  | Bool  of bool
  | Var   of var
  | Unop  of Ops.unop * expression
  | Binop of Ops.binop * expression * expression
  | Tpl   of expression list
  | TplGet of expression * int
  | FunRef of string (*référence vers une fonction *)
  | App   of expression * expression
  | If    of expression * expression * expression
  | LetIn of string * expression * expression
  | LetRec of string * expression * expression

type function_def = {
  name: string;
  code: expression; (*corps de la fonction qui ne contient pas de déclaration
                      de fonction. Celle ci sont toutes à top level*)
  param: string;
}

type program = {
  functions: function_def list;
  code: expression;
}
