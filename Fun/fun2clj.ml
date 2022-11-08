module VSet = Set.Make(String)

let translate_program e =
  let fdefs = ref [] in
  let new_fname =
    let cpt = ref (-1) in
    fun () -> incr cpt; Printf.sprintf "fun_%i" !cpt
  in

  (*fonction de traduction pour une expression:
    e: l'expression à traduire
    bvars: une liste de variables considérées comme liées
    return: parie (e', l) où
            e' -> l'expression traduite
            l  -> une liste d'association entre les variables libre
                  et numéros*)
  let rec tr_expr (e: Fun.expression) (bvars: VSet.t):
      Clj.expression * (string * int) list =
    let cvars = ref [] in (*[0]*)
    let new_cvar = (*fonction à appeler à chaque fois que l'on trouve une
                     nouvelle varaible libre pour
                     - l'enregistrement dans cvars
                     - *)
      let cpt = ref 0 in (* commencera à 1 *)
      fun x -> incr cpt; cvars := (x, !cpt) :: !cvars; !cpt
    in

    let rec convert_var x bvars =
      Clj.(if VSet.mem x bvars (*si c'est une variable lié, on conserve son nom*)
        then Name(x)
        else if List.mem_assoc x !cvars (*si variable libre déjà enregisté*)
        then CVar(List.assoc x !cvars)(*on donne on numéro*)
        else CVar(new_cvar x)) (*sinon on done un nouveau numéro*)
    (*va se promener dans les paramètre:
      prend en paramètre une expression
      return: l'expression traduite
      renvoie les association via un effet de bord [1] definit en [0]*)
    and crawl e bvars = match e with
      | Fun.Cst(n) ->
        Clj.Cst(n)

      | Fun.Bool(b) ->
        Clj.Bool(b)

      | Fun.Var(x) ->
        Clj.Var(convert_var x bvars)

      | Fun.Binop(op, e1, e2) ->
        Clj.Binop(op, crawl e1 bvars, crawl e2 bvars)

      | Fun.Unop(op, e) ->
        Clj.Unop(op, crawl e bvars)

      | Fun.LetIn(x, e1, e2) ->
        Clj.LetIn(x, crawl e1 bvars, crawl e2 (VSet.add x bvars))

      | Fun.LetRec(x,e1,e2) ->
        Clj.LetRec(x,crawl e1 bvars, crawl e2 (VSet.add x bvars))

      | Fun.Fun(x,e) ->
        (*créer une definition de fonction, et l'ajouter à la reférence fdefs*)
        (*pour cela, créer un nouveau nom avec new_fname*)
        (*renvoyer ybe expression créant une clôture fonctionnelle*)
        let n = new_fname () in
        let code, trucmuche = tr_expr e (VSet.singleton x) in
        let f = {Clj.name = n; Clj.code = code ; Clj.param = x} in
        fdefs:= f::!fdefs;
        let rec extrait cvars = match cvars with
        | (x,_)::xs -> Clj.Var(Clj.Name(x))::extrait xs
        | [] -> []
        in
        Clj.Tpl((Clj.FunRef(n))::(extrait trucmuche))


      | Fun.App(e1,e2) ->
        Clj.App(crawl e1 bvars,crawl e2 bvars)
      | Fun.Tpl(el) ->
        let n_el = List.map (fun x -> crawl x bvars) el in
        Clj.Tpl(n_el)

      | Fun.TplGet(e,i) ->
        Clj.TplGet(crawl e bvars,i)

      | Fun.If(e1,e2,e3) ->
        Clj.If(crawl e1 bvars,crawl e2 bvars, crawl e3 bvars)

      | _ ->
        failwith("TODO")

    in
    let te = crawl e bvars in
    te, !cvars (*[1]*)

  in
  let code, _ = tr_expr e VSet.empty in
  Clj.({
    functions = !fdefs;
    code = code;
  })
