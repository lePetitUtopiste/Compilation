
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | WHILE
    | VAR
    | STAR
    | SLASH
    | SET
    | SEMI
    | SBRK
    | RPAR
    | RETURN
    | RBRACKET
    | PUTCHAR
    | PRCT
    | PLUS
    | OR
    | NOT
    | NEQ
    | MINUS
    | MAIN
    | LT
    | LSR
    | LSL
    | LPAR
    | LE
    | LBRACKET
    | IF
    | IDENT of (
# 15 "impparser.mly"
       (string)
# 36 "impparser.ml"
  )
    | GT
    | GE
    | FUNCTION
    | EQ
    | EOF
    | END
    | ELSE
    | CST of (
# 13 "impparser.mly"
       (int)
# 48 "impparser.ml"
  )
    | COMMA
    | BOOL of (
# 14 "impparser.mly"
       (bool)
# 54 "impparser.ml"
  )
    | BEGIN
    | AND
    | AMPERSAND
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState135
  | MenhirState130
  | MenhirState121
  | MenhirState118
  | MenhirState114
  | MenhirState111
  | MenhirState105
  | MenhirState103
  | MenhirState100
  | MenhirState95
  | MenhirState91
  | MenhirState88
  | MenhirState86
  | MenhirState85
  | MenhirState75
  | MenhirState71
  | MenhirState69
  | MenhirState67
  | MenhirState65
  | MenhirState63
  | MenhirState61
  | MenhirState59
  | MenhirState57
  | MenhirState55
  | MenhirState53
  | MenhirState51
  | MenhirState49
  | MenhirState46
  | MenhirState44
  | MenhirState42
  | MenhirState40
  | MenhirState38
  | MenhirState29
  | MenhirState27
  | MenhirState26
  | MenhirState25
  | MenhirState24
  | MenhirState22
  | MenhirState21
  | MenhirState19
  | MenhirState18
  | MenhirState13
  | MenhirState11
  | MenhirState8
  | MenhirState5
  | MenhirState0

# 1 "impparser.mly"
  

  open Lexing
  open Imp
  open Ops


# 130 "impparser.ml"

let rec _menhir_goto_loption_separated_nonempty_list_COMMA_expression__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Imp.expression list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (f : (
# 15 "impparser.mly"
       (string)
# 148 "impparser.ml"
            ))), _, (xs : (Imp.expression list))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (Imp.expression) = let params = 
# 232 "<standard.mly>"
    ( xs )
# 155 "impparser.ml"
             in
            
# 86 "impparser.mly"
                                                             ( Call(f, params) )
# 160 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState75 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e : (Imp.expression))), _, (xs : (Imp.expression list))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Imp.expression) = let params = 
# 232 "<standard.mly>"
    ( xs )
# 186 "impparser.ml"
             in
            
# 91 "impparser.mly"
    ( match e with
      | Deref(e') -> PCall(e', params)
      | _ -> failwith "syntax error : call with function pointer should use *" )
# 193 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_instruction : _menhir_env -> 'ttv_tail -> _menhir_state -> (Imp.instruction) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
    | IDENT _v ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
    | IF ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | PUTCHAR ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | RETURN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | STAR ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | WHILE ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | END ->
        _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114

and _menhir_reduce23 : _menhir_env -> ('ttv_tail * _menhir_state) * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s), _, (e : (Imp.expression))) = _menhir_stack in
    let _1 = () in
    let _v : (Imp.expression) = 
# 87 "impparser.mly"
                    ( Deref(e) )
# 252 "impparser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce45 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Imp.expression list) = 
# 142 "<standard.mly>"
    ( [] )
# 261 "impparser.ml"
     in
    _menhir_goto_loption_separated_nonempty_list_COMMA_expression__ _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce27 : _menhir_env -> ((('ttv_tail * _menhir_state * (Imp.expression))) * _menhir_state * (Imp.expression)) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _v : (Imp.expression) = 
# 95 "impparser.mly"
    ( Deref(array_access e1 e2) )
# 273 "impparser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_separated_nonempty_list_COMMA_expression_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Imp.expression list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState75 | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Imp.expression list)) = _v in
        let _v : (Imp.expression list) = 
# 144 "<standard.mly>"
    ( x )
# 287 "impparser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_expression__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState71 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Imp.expression list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (Imp.expression))) = _menhir_stack in
        let _2 = () in
        let _v : (Imp.expression list) = 
# 243 "<standard.mly>"
    ( x :: xs )
# 299 "impparser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_expression_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run38 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38

and _menhir_run44 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44

and _menhir_run49 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49

and _menhir_run51 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51

and _menhir_run53 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53

and _menhir_run55 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55

and _menhir_run57 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57

and _menhir_run59 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59

and _menhir_run40 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40

and _menhir_run46 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_run61 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61

and _menhir_run42 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_run63 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63

and _menhir_run65 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65

and _menhir_run67 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67

and _menhir_run69 : _menhir_env -> 'ttv_tail * _menhir_state * (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69

and _menhir_goto_separated_nonempty_list_COMMA_IDENT_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (string list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (
# 15 "impparser.mly"
       (string)
# 763 "impparser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (string list) = 
# 243 "<standard.mly>"
    ( x :: xs )
# 769 "impparser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_IDENT_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (string list)) = _v in
        let _v : (string list) = 
# 144 "<standard.mly>"
    ( x )
# 779 "impparser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_IDENT__ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_instruction_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Imp.sequence) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState103 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | END ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ELSE ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | BEGIN ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | AMPERSAND ->
                        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                    | BOOL _v ->
                        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
                    | CST _v ->
                        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
                    | IDENT _v ->
                        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
                    | IF ->
                        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                    | LPAR ->
                        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                    | MINUS ->
                        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                    | NOT ->
                        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                    | PUTCHAR ->
                        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                    | RETURN ->
                        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                    | SBRK ->
                        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                    | STAR ->
                        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                    | WHILE ->
                        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                    | END ->
                        _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack) MenhirState111
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState111 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | END ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (c : (Imp.expression))), _, (s1 : (Imp.sequence))), _, (s2 : (Imp.sequence))) = _menhir_stack in
            let _11 = () in
            let _9 = () in
            let _8 = () in
            let _7 = () in
            let _5 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Imp.instruction) = 
# 69 "impparser.mly"
                                        ( If(c, s1, s2) )
# 880 "impparser.ml"
             in
            _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState114 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (Imp.instruction))), _, (xs : (Imp.sequence))) = _menhir_stack in
        let _v : (Imp.sequence) = 
# 213 "<standard.mly>"
    ( x :: xs )
# 896 "impparser.ml"
         in
        _menhir_goto_list_instruction_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState85 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | END ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (c : (Imp.expression))), _, (s : (Imp.sequence))) = _menhir_stack in
            let _7 = () in
            let _5 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Imp.instruction) = 
# 71 "impparser.mly"
                                  ( While(c, s) )
# 917 "impparser.ml"
             in
            _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | END ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((((_menhir_stack, _menhir_s), (name : (
# 15 "impparser.mly"
       (string)
# 938 "impparser.ml"
            ))), _, (xs : (string list))), _, (locals : (string list))), _, (code : (Imp.sequence))) = _menhir_stack in
            let _9 = () in
            let _6 = () in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Imp.function_def) = let params = 
# 232 "<standard.mly>"
    ( xs )
# 948 "impparser.ml"
             in
            
# 61 "impparser.mly"
    ( {name; code; params; locals} )
# 953 "impparser.ml"
             in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | FUNCTION ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | MAIN ->
                _menhir_reduce37 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState130 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | END ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, (s : (Imp.sequence))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Imp.sequence) = 
# 55 "impparser.mly"
                                     ( s )
# 990 "impparser.ml"
             in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EOF ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((_menhir_stack, _menhir_s, (globals : (string list))), _, (functions : (Imp.function_def list))), (main : (Imp.sequence))) = _menhir_stack in
                let _4 = () in
                let _v : (
# 32 "impparser.mly"
      (Imp.program)
# 1005 "impparser.ml"
                ) = 
# 40 "impparser.mly"
    ( {main; functions; globals} )
# 1009 "impparser.ml"
                 in
                _menhir_goto_program _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_reduce3 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 15 "impparser.mly"
       (string)
# 1030 "impparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (id : (
# 15 "impparser.mly"
       (string)
# 1036 "impparser.ml"
    ))) = _menhir_stack in
    let _v : (Imp.expression) = 
# 82 "impparser.mly"
           ( Var(id) )
# 1041 "impparser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "impparser.mly"
       (string)
# 1077 "impparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
    | AND | COMMA | EQ | GE | GT | LBRACKET | LE | LSL | LSR | LT | MINUS | NEQ | OR | PLUS | PRCT | RBRACKET | RPAR | SEMI | SET | SLASH | STAR ->
        _menhir_reduce3 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run29 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 15 "impparser.mly"
       (string)
# 1098 "impparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | RPAR ->
        _menhir_reduce45 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29

and _menhir_goto_expression : _menhir_env -> 'ttv_tail -> _menhir_state -> (Imp.expression) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState75 | MenhirState71 | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | AMPERSAND ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | BOOL _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
            | CST _v ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
            | IDENT _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
            | LPAR ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | MINUS ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | NOT ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | SBRK ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | STAR ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71)
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Imp.expression))) = _menhir_stack in
            let _v : (Imp.expression list) = 
# 241 "<standard.mly>"
    ( [ x ] )
# 1203 "impparser.ml"
             in
            _menhir_goto_separated_nonempty_list_COMMA_expression_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LT | MINUS | NEQ | OR | PLUS | PRCT | RBRACKET | RPAR | SEMI | SET | SLASH | STAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 106 "impparser.mly"
       ( Mul )
# 1230 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1235 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LSL | LSR | LT | MINUS | NEQ | OR | PLUS | PRCT | RBRACKET | RPAR | SEMI | SET | SLASH | STAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 110 "impparser.mly"
      ( Lsr )
# 1258 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1263 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | RBRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce27 _menhir_env (Obj.magic _menhir_stack)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LT | MINUS | NEQ | OR | PLUS | PRCT | RBRACKET | RPAR | SEMI | SET | SLASH | STAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 107 "impparser.mly"
        ( Div )
# 1337 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1342 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LSL | LSR | LT | MINUS | NEQ | OR | PLUS | PRCT | RBRACKET | RPAR | SEMI | SET | SLASH | STAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 109 "impparser.mly"
      ( Lsl )
# 1365 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1370 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LT | MINUS | NEQ | OR | PLUS | PRCT | RBRACKET | RPAR | SEMI | SET | SLASH | STAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 108 "impparser.mly"
       ( Rem )
# 1397 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1402 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LT | MINUS | NEQ | OR | PLUS | RBRACKET | RPAR | SEMI | SET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 104 "impparser.mly"
       ( Add )
# 1435 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1440 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | OR | RBRACKET | RPAR | SEMI | SET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 118 "impparser.mly"
     ( Or )
# 1489 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1494 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LT | NEQ | OR | RBRACKET | RPAR | SEMI | SET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 112 "impparser.mly"
      ( Neq )
# 1531 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1536 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LT | MINUS | NEQ | OR | PLUS | RBRACKET | RPAR | SEMI | SET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 105 "impparser.mly"
        ( Sub )
# 1569 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1574 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LT | NEQ | OR | RBRACKET | RPAR | SEMI | SET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 113 "impparser.mly"
     ( Lt )
# 1611 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1616 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LT | NEQ | OR | RBRACKET | RPAR | SEMI | SET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 114 "impparser.mly"
     ( Le )
# 1653 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1658 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LT | NEQ | OR | RBRACKET | RPAR | SEMI | SET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 115 "impparser.mly"
     ( Gt )
# 1695 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1700 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LT | NEQ | OR | RBRACKET | RPAR | SEMI | SET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 116 "impparser.mly"
     ( Ge )
# 1737 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1742 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LT | NEQ | OR | RBRACKET | RPAR | SEMI | SET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 111 "impparser.mly"
     ( Eq )
# 1779 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1784 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | OR | RBRACKET | RPAR | SEMI | SET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 117 "impparser.mly"
      ( And )
# 1833 "impparser.ml"
             in
            
# 85 "impparser.mly"
                                       ( Binop(op, e1, e2) )
# 1838 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | AMPERSAND ->
                    _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | BOOL _v ->
                    _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
                | CST _v ->
                    _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
                | IDENT _v ->
                    _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
                | LPAR ->
                    _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | MINUS ->
                    _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | NOT ->
                    _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | SBRK ->
                    _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | STAR ->
                    _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | RPAR ->
                    _menhir_reduce45 _menhir_env (Obj.magic _menhir_stack) MenhirState75
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75)
            | AND | COMMA | EQ | GE | GT | LBRACKET | LE | LSL | LSR | LT | MINUS | NEQ | OR | PLUS | PRCT | RBRACKET | RPAR | SEMI | SET | SLASH | STAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _, (e : (Imp.expression))) = _menhir_stack in
                let _3 = () in
                let _1 = () in
                let _v : (Imp.expression) = 
# 83 "impparser.mly"
                         ( e )
# 1922 "impparser.ml"
                 in
                _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LT | MINUS | NEQ | OR | PLUS | RBRACKET | RPAR | SEMI | SET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 99 "impparser.mly"
        ( Minus )
# 1965 "impparser.ml"
             in
            
# 84 "impparser.mly"
                       ( Unop(op, e) )
# 1970 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LSL | LSR | LT | MINUS | NEQ | OR | PLUS | PRCT | RBRACKET | RPAR | SEMI | SET | SLASH | STAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Imp.expression))) = _menhir_stack in
            let _1 = () in
            let _v : (Imp.expression) = let op = 
# 100 "impparser.mly"
      ( Not )
# 1993 "impparser.ml"
             in
            
# 84 "impparser.mly"
                       ( Unop(op, e) )
# 1998 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Imp.expression))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Imp.expression) = 
# 89 "impparser.mly"
                              ( Sbrk(e) )
# 2051 "impparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | AND | COMMA | EQ | GE | GT | LE | LT | MINUS | NEQ | OR | PLUS | PRCT | RBRACKET | RPAR | SEMI | SET | SLASH | STAR ->
            _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | AMPERSAND ->
                    _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | BOOL _v ->
                    _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
                | CST _v ->
                    _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
                | IDENT _v ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
                | IF ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | LPAR ->
                    _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | MINUS ->
                    _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | NOT ->
                    _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | PUTCHAR ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | RETURN ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | SBRK ->
                    _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | STAR ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | WHILE ->
                    _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | END ->
                    _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack) MenhirState85
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState86 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | SET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | AMPERSAND ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | BOOL _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
            | CST _v ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
            | IDENT _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
            | LPAR ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | MINUS ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | NOT ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | SBRK ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | STAR ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88)
        | AND | EQ | GE | GT | LE | LT | MINUS | NEQ | OR | PLUS | PRCT | SEMI | SLASH | STAR ->
            _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState88 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Imp.instruction) = 
# 74 "impparser.mly"
                                            ( Write(e1, e2) )
# 2264 "impparser.ml"
             in
            _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState91 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Imp.expression))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Imp.instruction) = 
# 72 "impparser.mly"
                           ( Return(e) )
# 2320 "impparser.ml"
             in
            _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState95 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | SEMI ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _, (e : (Imp.expression))) = _menhir_stack in
                let _5 = () in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Imp.instruction) = 
# 65 "impparser.mly"
                                      ( Putchar(e) )
# 2383 "impparser.ml"
                 in
                _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | AMPERSAND ->
                    _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                | BOOL _v ->
                    _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
                | CST _v ->
                    _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
                | IDENT _v ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
                | IF ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                | LPAR ->
                    _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                | MINUS ->
                    _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                | NOT ->
                    _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                | PUTCHAR ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                | RETURN ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                | SBRK ->
                    _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                | STAR ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                | WHILE ->
                    _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                | END ->
                    _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState105 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (id : (
# 15 "impparser.mly"
       (string)
# 2533 "impparser.ml"
            ))), _, (e : (Imp.expression))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (Imp.instruction) = 
# 66 "impparser.mly"
                                 ( Set(id, e) )
# 2540 "impparser.ml"
             in
            _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState130 | MenhirState19 | MenhirState85 | MenhirState103 | MenhirState111 | MenhirState114 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | AMPERSAND ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | BOOL _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
            | CST _v ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
            | IDENT _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
            | LPAR ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | MINUS ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | NOT ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | SBRK ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | STAR ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState118
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Imp.expression))) = _menhir_stack in
            let _2 = () in
            let _v : (Imp.instruction) = 
# 73 "impparser.mly"
                    ( Expr(e) )
# 2620 "impparser.ml"
             in
            _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState118 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | RBRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | SET ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | AMPERSAND ->
                    _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState121
                | BOOL _v ->
                    _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState121 _v
                | CST _v ->
                    _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState121 _v
                | IDENT _v ->
                    _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState121 _v
                | LPAR ->
                    _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState121
                | MINUS ->
                    _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState121
                | NOT ->
                    _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState121
                | SBRK ->
                    _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState121
                | STAR ->
                    _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState121
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState121)
            | AND | EQ | GE | GT | LBRACKET | LE | LSL | LSR | LT | MINUS | NEQ | OR | PLUS | PRCT | SEMI | SLASH | STAR ->
                _menhir_reduce27 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState121 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | LSL ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | LSR ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PRCT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Imp.expression))), _, (e2 : (Imp.expression))), _, (e3 : (Imp.expression))) = _menhir_stack in
            let _7 = () in
            let _5 = () in
            let _4 = () in
            let _2 = () in
            let _v : (Imp.instruction) = 
# 76 "impparser.mly"
    ( Write(array_access e1 e2, e3) )
# 2761 "impparser.ml"
             in
            _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
        | SLASH ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_function_def_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Imp.function_def list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | MAIN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | AMPERSAND ->
                    _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState130
                | BOOL _v ->
                    _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
                | CST _v ->
                    _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
                | IDENT _v ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
                | IF ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState130
                | LPAR ->
                    _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState130
                | MINUS ->
                    _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState130
                | NOT ->
                    _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState130
                | PUTCHAR ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState130
                | RETURN ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState130
                | SBRK ->
                    _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState130
                | STAR ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState130
                | WHILE ->
                    _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState130
                | END ->
                    _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack) MenhirState130
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                raise _eRR)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState135 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (Imp.function_def))), _, (xs : (Imp.function_def list))) = _menhir_stack in
        let _v : (Imp.function_def list) = 
# 213 "<standard.mly>"
    ( x :: xs )
# 2846 "impparser.ml"
         in
        _menhir_goto_list_function_def_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_separated_nonempty_list_COMMA_IDENT__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | VAR ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | AMPERSAND | BOOL _ | CST _ | END | IDENT _ | IF | LPAR | MINUS | NOT | PUTCHAR | RETURN | SBRK | STAR | WHILE ->
                _menhir_reduce41 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "impparser.mly"
       (string)
# 2893 "impparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13)
    | RPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (
# 15 "impparser.mly"
       (string)
# 2916 "impparser.ml"
        ))) = _menhir_stack in
        let _v : (string list) = 
# 241 "<standard.mly>"
    ( [ x ] )
# 2921 "impparser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_IDENT_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_reduce39 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Imp.sequence) = 
# 211 "<standard.mly>"
    ( [] )
# 2941 "impparser.ml"
     in
    _menhir_goto_list_instruction_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPERSAND ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | BOOL _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | CST _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | IDENT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | LPAR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | MINUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | NOT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | SBRK ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | STAR ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run86 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState86

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPERSAND ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | BOOL _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | CST _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | IDENT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | LPAR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | MINUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | NOT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | SBRK ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | STAR ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run91 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91

and _menhir_run94 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPERSAND ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState95
        | BOOL _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
        | CST _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
        | IDENT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
        | LPAR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState95
        | MINUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState95
        | NOT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState95
        | SBRK ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState95
        | STAR ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState95
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState95)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | BOOL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | CST _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | IDENT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | LPAR ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | MINUS ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | NOT ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | SBRK ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | STAR ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_run99 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPERSAND ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | BOOL _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | CST _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | IDENT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | LPAR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | MINUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | NOT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | SBRK ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | STAR ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run104 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "impparser.mly"
       (string)
# 3253 "impparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
    | SET ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPERSAND ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | BOOL _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
        | CST _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
        | IDENT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
        | LPAR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | MINUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | NOT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | SBRK ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | STAR ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105)
    | AND | EQ | GE | GT | LBRACKET | LE | LSL | LSR | LT | MINUS | NEQ | OR | PLUS | PRCT | SEMI | SLASH | STAR ->
        _menhir_reduce3 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "impparser.mly"
       (int)
# 3301 "impparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (n : (
# 13 "impparser.mly"
       (int)
# 3309 "impparser.ml"
    )) = _v in
    let _v : (Imp.expression) = 
# 80 "impparser.mly"
        ( Cst(n) )
# 3314 "impparser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "impparser.mly"
       (bool)
# 3321 "impparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (b : (
# 14 "impparser.mly"
       (bool)
# 3329 "impparser.ml"
    )) = _v in
    let _v : (Imp.expression) = 
# 81 "impparser.mly"
         ( Bool(b) )
# 3334 "impparser.ml"
     in
    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run32 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (id : (
# 15 "impparser.mly"
       (string)
# 3351 "impparser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (Imp.expression) = 
# 88 "impparser.mly"
                     ( Addr(id) )
# 3358 "impparser.ml"
         in
        _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce37 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Imp.function_def list) = 
# 211 "<standard.mly>"
    ( [] )
# 3373 "impparser.ml"
     in
    _menhir_goto_list_function_def_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | IDENT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
            | RPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState11 in
                let _v : (string list) = 
# 142 "<standard.mly>"
    ( [] )
# 3402 "impparser.ml"
                 in
                _menhir_goto_loption_separated_nonempty_list_COMMA_IDENT__ _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_program : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 32 "impparser.mly"
      (Imp.program)
# 3425 "impparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 32 "impparser.mly"
      (Imp.program)
# 3433 "impparser.ml"
    )) = _v in
    Obj.magic _1

and _menhir_goto_list_variable_decl_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (string))), _, (xs : (string list))) = _menhir_stack in
        let _v : (string list) = 
# 213 "<standard.mly>"
    ( x :: xs )
# 3448 "impparser.ml"
         in
        _menhir_goto_list_variable_decl_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | FUNCTION ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | MAIN ->
            _menhir_reduce37 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8)
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPERSAND ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | BOOL _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
        | CST _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
        | IDENT _v ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
        | IF ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LPAR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | MINUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | NOT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | PUTCHAR ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | RETURN ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | SBRK ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | STAR ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | WHILE ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | END ->
            _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState135 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState130 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState121 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState118 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState114 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState111 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState105 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState103 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState95 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState91 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState88 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState86 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState85 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState75 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState71 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState0 in
        let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _startpos__1_ = _startpos in
        let _1 = () in
        let _v : (
# 32 "impparser.mly"
      (Imp.program)
# 3697 "impparser.ml"
        ) = let _startpos = _startpos__1_ in
        
# 41 "impparser.mly"
        ( let pos = _startpos in
          let message =
            Printf.sprintf
              "Syntax error at %d, %d"
              pos.pos_lnum pos.pos_cnum
          in
          failwith message )
# 3708 "impparser.ml"
         in
        _menhir_goto_program _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (string list) = 
# 211 "<standard.mly>"
    ( [] )
# 3717 "impparser.ml"
     in
    _menhir_goto_list_variable_decl_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), (id : (
# 15 "impparser.mly"
       (string)
# 3740 "impparser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (string) = 
# 51 "impparser.mly"
                    ( id )
# 3747 "impparser.ml"
             in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | VAR ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | AMPERSAND | BOOL _ | CST _ | END | FUNCTION | IDENT _ | IF | LPAR | MAIN | MINUS | NOT | PUTCHAR | RETURN | SBRK | STAR | WHILE ->
                _menhir_reduce41 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and program : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 32 "impparser.mly"
      (Imp.program)
# 3790 "impparser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAR ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FUNCTION | MAIN ->
        _menhir_reduce41 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 269 "<standard.mly>"
  

# 3816 "impparser.ml"
