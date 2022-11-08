module STbl = Map.Make(String)
(*traduction d'une variable,
  - soit par un accès à la cloture
  - soit par un accès direct
  - soit par un accès via le "nom unique"*)
let tr_var v env = match v with
  | Clj.Name(x) -> (*cas d'une variable nommée*)
    Imp.(if STbl.mem x env then Var(STbl.find x env) else Var x)

  | Clj.CVar(n) ->(**)
    Imp.(array_get (Var "closure") (Cst n))

let tr_expr e env =
  (*un compteur pour générer des nom de variables uniques*)
  let cpt = ref (-1) in
  (*la liste des noms de variables uniques générés*)
  let vars = ref [] in
  (*création d'un nom de variable de la forme x_n avec enregistrement dans vars*)
  let new_var id =
    incr cpt;
    let v = Printf.sprintf "%s_%i" id !cpt in
    vars := v :: !vars;
    v
  in

  (*Traduction d'une expression.
    Paramètres:
      -e: expressonà traduire
      - env correspondance entre les noms de variables clj et les noms de variables IMP
      return: paire (s,e')
              -s une séquence d'instructions
              - e': une expressions
              idée: exécuter s puis évaluer e' dans IMP est équivalent à évaluer e dans CLJ *)
  let rec tr_expr (e: Clj.expression) (env: string STbl.t):
      Imp.sequence * Imp.expression =
    match e with
      | Clj.Cst(n) ->
        [], Imp.Cst(n)

      | Clj.Bool(b) ->
        [], Imp.Bool(b)

      | Clj.Var(v) ->
        [], tr_var v env (*fonction aux pour comprendre la variable en fonc de sa nature*)

      | Clj.Binop(op, e1, e2) -> (*on traduit chacune des sous expressions*)
        let is1, te1 = tr_expr e1 env in
        let is2, te2 = tr_expr e2 env in
        is1 @ is2, Imp.Binop(op, te1, te2)

      | Clj.Unop(op,e1) ->
        let is1,te1 = tr_expr e1 env in
        is1,Imp.Unop(op,te1)

      | Clj.LetIn(x, e1, e2) ->
        let lv = new_var x in (*création d'une nouvelle variable à partir de x sert dans le cas [1]*)
        let is1, t1 = tr_expr e1 env in (*viens du prof*)
        let is2, t2 = tr_expr e2 (STbl.add x lv env) in (*il s'agit d'avoir localement des tables de noms locales*)
        Imp.(is1 @ [Set(lv, t1)] @ is2, t2)

      | Clj.LetRec(x, e1, e2) ->
        let lv = new_var x in (*création d'une nouvelle variable à partir de x sert dans le cas [1]*)
        let is1, t1 = tr_expr e1 (STbl.add x lv env) in (*viens du prof*)
        let is2, t2 = tr_expr e2 (STbl.add x lv env) in (*il s'agit d'avoir localement des tables de noms locales*)
        Imp.(is1 @ [Set(lv, t1)] @ is2, t2)

        (*Le tuple va créer une nouvelle variable*)
        |Clj.Tpl(e) ->
        let var = new_var "test" in
        let alloc = (Imp.array_create (Imp.Cst(List.length e))) in
        let rec parcours seq acc =
          match seq with
          | [] -> []
          | n::suite -> let s1,exp = tr_expr n env in
                        (Imp.array_set (Imp.Var(var)) (Imp.Cst(acc)) (exp))::(parcours suite (acc + 1))
        in
        Imp.Set(var,alloc)::(parcours e 0),Imp.Var(var)


      | Clj.TplGet(e1,i) ->
        let s1,e = tr_expr e1 env in
        s1, (Imp.array_get (e) (Imp.Cst(i)))

      | Clj.If(e1,e2,e3) ->
        let var = new_var "res" in
        let s1,ex1 = tr_expr e1 env in
        let s2,ex2 = tr_expr e2 env in
        let s3,ex3 = tr_expr e3 env in
        s1 @ [If(ex1,s2 @ [Set(var,ex2)], s3@ [Set(var,ex3)] )],Var(var)

      | Clj.App(e1,e2) ->
        let s1,ex1 = tr_expr e1 env in
        let s2,ex2 = tr_expr e2 env in

        s1@s2,Imp.PCall(Deref((Imp.array_get (ex1) (Cst(0)) )),[ex2;ex1])

      | Clj.FunRef(x) ->
        [],Imp.Addr(x)

      | _ ->
        failwith "todo"
(*[1] cas de masquage: let x = 4 in let x = 8 in x traduit en let x1 = 4 in let x2 = 8 in x2 *)
  in

  let is, te = tr_expr e env in
  is, te, !vars (*ensemble de variables*)


let tr_fdef fdef =
  let env =
    let x = Clj.(fdef.param) in
    STbl.add x ("param_" ^ x) STbl.empty
  in
  let is, te, locals = tr_expr Clj.(fdef.code) env in
  Imp.({
    name = Clj.(fdef.name);
    code = is @ [Return te];
    params = ["param_" ^ Clj.(fdef.param); "closure"];
    locals = locals;
  })


let translate_program prog =
  let functions = List.map tr_fdef Clj.(prog.functions) in
  let is, te, globals = tr_expr Clj.(prog.code) STbl.empty in
  let main = Imp.(is @ [Expr(Call("print_int", [te]))]) in
  Imp.({main; functions; globals})
