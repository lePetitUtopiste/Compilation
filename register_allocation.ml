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
       let out1 = VSet.add "$a0" out in
       let out1 = VSet.add "$a1" out1 in
       let out1 = VSet.add "$a2" out1 in
       let out1 = VSet.add "$a3" out1 in

       let out1 = VSet.remove "$t2" out1 in
       let out1 = VSet.remove "$t3" out1 in
       let out1 = VSet.remove "$t4" out1 in
       let out1 = VSet.remove "$t5" out1 in
       let out1 = VSet.remove "$t6" out1 in
       let out1 = VSet.remove "$t7" out1 in
       let out1 = VSet.remove "$t8" out1 in
       VSet.remove "$t9" out1

       (*on cosidère les paramètres lu on va donc considéré les registre *)
    | Return ->
       let out1 = VSet.add "$v0" out in
       let out1 = VSet.add "$s0" out1 in
       let out1 = VSet.add "$s1" out1 in
       let out1 = VSet.add "$s2" out1 in
       let out1 = VSet.add "$s3" out1 in
       let out1 = VSet.add "$s4" out1 in
       let out1 = VSet.add "$s5" out1 in
       let out1 = VSet.add "$s6" out1 in
       VSet.add "$s7" out1

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
  (*fonction de parcours des séquences*)
  let rec seq s g = match s with
    | Nop -> g
    | Instr(n, i) -> instr n i g
    | Seq(s1, s2) -> seq s1 (seq s2 g)
   (*fonction de parcours des *)
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
      let g1 = seq s1 g in
      seq s2 g1
    | While(s1, _, s2) ->
       seq s2 (seq s1 g)
    | Move(rd, rs) ->
        (*pour l'instant on ne gère pas les liens de préférences*)
        let out = Hashtbl.find live_out n in
        VSet.fold (fun r g' -> if r <> rd && r <> rs  then
                                 Graph.add_edge r rd Conflict g'
                               else g')
                 out
                 g
    | Putchar _ | Write _ | Return | Push _ | Pop _ ->
       g (*certain que c'est faux TODO corriger ce truc*)
    | Call(_, _) ->
    let out = Hashtbl.find live_out n in
    VSet.fold (fun r g' -> if r <> "$v0" then
                             Graph.add_edge r "$v0" Conflict g'
                           else g')
                 out
                 g
  in
  seq fdef.code g


type color = int VMap.t


(* Renvoie la plus petit couleur non utilisée par l'ensemble [v]. *)
let choose_color v colors =
  let val_max = VSet.fold (fun elt cpt_max -> if colors[elt] <= cpt_max then cpt_max else colors[elt]) v 0 in
  val_max + 1
let color g k =

  let george x y g =
    if String.get x 0 == '$' then
      false
    else
      let voisins_x = VSet.filter (fun x -> (Graph.degree x g < k)) (Graph.neighbours x Conflict g) in
      let voisins_y = Graph.neighbours y Conflict g in
      let inter = VSet.inter voisins_x voisins_y in
      false

  in

  (** Recherche d'un sommet à colorier.
      On cherche un sommet [x] de degré < K, et qui n'a pas d'arêtes de
      préférence. Si on en trouve un on appelle [select x g], et sinon
      on passe à [coalesce].

      Heuristique : parmi les sommets sélectionnables, prendre un sommet
      de faible degré.
   *)
  let rec simplify g =
    (*let seq = VMap.to_seq g in
    let rec find_min seq max =
      match seq with
      | (key,_)::suite  -> if (Graph.degree key g) < max then key else find_min suite max
      | _ -> ""
    in

    let x = find_min seq 32 in
    if x == "" then coalesce g else select x g
    *)
    failwith "not implemented"

(** Recherche de deux sommets à fusionner.
  Parmi les sommets liés par des arêtes de préférence, on en cherche
  deux qui satisfont le critère de George. Si on trouve une telle
  paire (x, y), on colorie avec [simplify] le graphe [g'] obtenu en
  fusionnant [x] avec [y], puis on propage à [x] la couleur qui a
  été affectée à [y]. Dans le cas contraire, on passe à [freeze]
**)

  and coalesce g =
    failwith "not implemented"

(** Abandon d'arêtes de préférence.
    On cherche un sommet de degré < K. S'il existe un tel sommet [x],
    celui-ci a nécessairement des arêtes de préférence. On les retire
    et on revient à [simplify]. Sinon, on passe à [spill].
 *)
  and freeze g =
    failwith "not implemented"

(** Sacrifice d'un sommet.
    On se résigne à ne (peut-être) pas pouvoir donner à l'un des sommets
    une couleur < K. On choisit un sommet [x] et on appelle [select x g].
    Note : le fait qu'un sommet [x] ait un degré >= K signifie qu'il n'est
    pas certain qu'il puisse recevoir une couleur < K après que ses voisins
    auront été coloriés. Mais avec un peu de chance cela fonctionnera
    quand même !

    Exception : on peut également arriver ici dans le cas où tous les
    sommets restants sont déjà coloriés (car il ne reste que des sommets
    correspondant à des registres réels). Dans ce cas on a atteint le cas
    de base de notre récursion.

    Heuristiques :
    - favoriser un sommet correspondant à un registre peu utilisé, pour
      limiter le nombre d'accès à la mémoire dans l'hypothèse où le sommet
      sacrifié serait effectivement associé à un emplacement de pile
      (note : ce critère demande d'avoir collecté des infos sur la
      fréquence d'utilisation estimée des différents registres),
    - favoriser des sommets de fort degré, dont la suppression va donc
      supprimer de nombreuses arêtes et faciliter le coloriage des autres
      registres.
 *)
  and spill g =
    failwith "not implemented"


(** Mettre de côté un sommet [x] et colorier récursivement le graphe [g']
     ainsi obtenu. À la fin, on choisit une couleur pour [x] compatible
     avec les couleurs sélectionnées pour ses voisins.
  *)
  and select x g =
    (*
    let c = simplify (Graph.remove_vertex x g)  in
    let voisin = Graph.neighbours x Conflict g in
    VMap.add x (choose_color voisin c) c
    *)
    failwith "not implemented"


  in
  simplify g

let print_colors c =
  Printf.(printf "Coloration : \n";
          VMap.iter (printf "  %s: %i\n") c)

(**
   4/ Conclusion
   Les couleurs sont des numéros. Les numéros de 0 à K-1 sont associés
   aux K registres physiques utilisés, et les numéros suivants à des
   emplacements dans la pile.
 *)

let allocation (fdef: function_def): register Graph.VMap.t * int =
  (* Calculer les vivacités, en déduire un graphe d'interférence,
     le colorier, puis en déduire :
     - une affectation concrète de chaque sommet à un registre réel
       ou un emplacement de pile,
     - le nombre d'emplacements de pile utilisés.
   *)
   Printf.printf "debut exécution de l'allocation pour la fonctions %s\n" fdef.name;
   Printf.printf "\nparam:\n\n";
   List.iter (fun x -> Printf.printf "- %s\n" x) fdef.params;
   Printf.printf "\nlocales:\n\n";
   List.iter (fun x -> Printf.printf "- %s\n\n\n" x) fdef.locals;


   let graph = interference_graph fdef in
   Graph.print_graph graph;

   let cpt = ref 0  in

   let rec find_index elt l cpt =
      match l with
      | hd::tl -> Printf.printf "[find_index:%s] %i | %s\n" elt cpt hd;
                  if (elt = hd)
                    then begin
                      Printf.printf "[find_index:%s] fin recherche %i" elt cpt;
                      cpt
                      end
                    else
                      find_index elt tl (cpt+1)
      | _ -> failwith "Not_found"
   in
   (*va chercher le nom dans la liste des param et des local et assigné un
   décalage respectivement de la forme 4*x -4*x *)
   let decide_placement nom  =
    if (String.get nom 0) == '$'then begin Actual(nom) end
    else
        begin
        cpt := !cpt + 1;
        if List.mem nom fdef.locals then Stacked (-4*(find_index nom fdef.locals 2 ))
        else
          if List.mem nom fdef.params then Stacked (4*(find_index nom fdef.params 1 ))
          else failwith "oups les variables globales apparaissent dans le graphe"
        end
   in
   let rec iterate_keys bind  =
    let result_map :register Graph.VMap.t = VMap.empty in
    match bind with
    | (nom,data)::tl -> VMap.add nom (decide_placement nom ) (iterate_keys tl)
    | _ ->  VMap.empty
   in
   let map_alloc = iterate_keys (VMap.bindings graph) in

   (*fonction utilisé pour rajouter des valeurs à l'allocation en cas de problèmes*)
   let add_param l =
     let rec add_param_rec l cpt =
        match l with
        | hd :: lt -> Printf.printf "   %s\n" hd; if (cpt >= 3)
                                                  then VMap.add hd (decide_placement hd ) (add_param_rec lt (cpt+1))
                                                  else VMap.add hd (Actual("$a"^string_of_int (cpt+1))) (add_param_rec lt (cpt+1))
        | _ -> map_alloc
     in
     add_param_rec l 0
   in

   let rec add_register nom_registre nbr_registre alloc =
    if nbr_registre = -1 then alloc
    else if (nbr_registre = -2) then VMap.add nom_registre  (Actual(nom_registre)) alloc
    else
      let nom = (nom_registre ^ Stdlib.string_of_int nbr_registre) in
      VMap.add nom  (Actual(nom)) (add_register nom_registre (nbr_registre - 1) alloc)
   in

   let map_alloc = add_param fdef.params in
   (* let map_alloc = add_register "$a" 3 map_alloc in *)
   (* let map_alloc = add_register "$sp" (-2) map_alloc in *)

   Printf.printf "\nResultat allocation: \n\n";
   let print_reg reg =
    match reg with
    | Actual(r) -> Printf.printf "- reg %s\n" r
    | Stacked(i) -> Printf.printf "- stack pos %i\n" i
    in

    (*affichage de la map d'allocation*)
   VMap.iter (fun key data -> (Printf.printf "%s -> " key); print_reg data ) map_alloc;
   (map_alloc, !cpt)
