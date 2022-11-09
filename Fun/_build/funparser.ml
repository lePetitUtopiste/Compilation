
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | THEN
    | STAR
    | SLASH
    | RPAR
    | REC
    | RBRACKET
    | PLUS
    | OR
    | NOT
    | NEQ
    | MOD
    | MINUS
    | LT
    | LSR
    | LSL
    | LPAR
    | LET
    | LE
    | LBRACKET
    | IN
    | IF
    | IDENT of (
# 15 "funparser.mly"
       (string)
# 32 "funparser.ml"
  )
    | GT
    | GE
    | FUN
    | EQ
    | EOF
    | ELSE
    | CST of (
# 13 "funparser.mly"
       (int)
# 43 "funparser.ml"
  )
    | COMMA
    | BOOL of (
# 14 "funparser.mly"
       (bool)
# 49 "funparser.ml"
  )
    | ARROW
    | AND
  
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
  | MenhirState81
  | MenhirState78
  | MenhirState76
  | MenhirState75
  | MenhirState72
  | MenhirState70
  | MenhirState69
  | MenhirState68
  | MenhirState67
  | MenhirState66
  | MenhirState64
  | MenhirState63
  | MenhirState62
  | MenhirState61
  | MenhirState60
  | MenhirState59
  | MenhirState58
  | MenhirState57
  | MenhirState56
  | MenhirState55
  | MenhirState54
  | MenhirState53
  | MenhirState52
  | MenhirState51
  | MenhirState50
  | MenhirState49
  | MenhirState48
  | MenhirState47
  | MenhirState46
  | MenhirState45
  | MenhirState44
  | MenhirState43
  | MenhirState42
  | MenhirState41
  | MenhirState40
  | MenhirState39
  | MenhirState38
  | MenhirState37
  | MenhirState36
  | MenhirState35
  | MenhirState34
  | MenhirState33
  | MenhirState32
  | MenhirState31
  | MenhirState30
  | MenhirState28
  | MenhirState27
  | MenhirState26
  | MenhirState25
  | MenhirState24
  | MenhirState19
  | MenhirState16
  | MenhirState15
  | MenhirState12
  | MenhirState11
  | MenhirState8
  | MenhirState3
  | MenhirState2
  | MenhirState1
  | MenhirState0

# 1 "funparser.mly"
  

  open Lexing
  open Fun
  open Ops


# 138 "funparser.ml"

let rec _menhir_goto_separated_nonempty_list_COMMA_expression_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Fun.program list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e : (Fun.program))), _), _, (es : (Fun.program list))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Fun.program) = 
# 53 "funparser.mly"
    ( Tpl(e :: es) )
# 160 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState76 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (x : (Fun.program))), _), _, (xs : (Fun.program list))) = _menhir_stack in
        let _2 = () in
        let _v : (Fun.program list) = 
# 243 "<standard.mly>"
    ( x :: xs )
# 177 "funparser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_expression_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run71 : _menhir_env -> ('ttv_tail * _menhir_state) * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let ((_menhir_stack, _menhir_s), _, (e : (Fun.program))) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : (Fun.program) = 
# 45 "funparser.mly"
                         ( e )
# 193 "funparser.ml"
     in
    _menhir_goto_simple_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run25 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run32 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32

and _menhir_run34 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34

and _menhir_run38 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38

and _menhir_run40 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40

and _menhir_run36 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36

and _menhir_run42 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_run44 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44

and _menhir_run27 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_run30 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30

and _menhir_run46 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_run48 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48

and _menhir_run50 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50

and _menhir_run52 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52

and _menhir_run54 : _menhir_env -> 'ttv_tail * _menhir_state * (Fun.program) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54

and _menhir_goto_list_IDENT_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (
# 15 "funparser.mly"
       (string)
# 642 "funparser.ml"
        ))), _, (xs : (string list))) = _menhir_stack in
        let _v : (string list) = 
# 213 "<standard.mly>"
    ( x :: xs )
# 647 "funparser.ml"
         in
        _menhir_goto_list_IDENT_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BOOL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
            | CST _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
            | FUN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
            | IF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | LET ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | LPAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | MINUS ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | NOT ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState64 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BOOL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
            | CST _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
            | FUN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
            | IF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | LET ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | LPAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | MINUS ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | NOT ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_expression : _menhir_env -> 'ttv_tail -> _menhir_state -> (Fun.program) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | EQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | GE ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | GT ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | LE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | LT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | NEQ ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | OR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | COMMA | ELSE | EOF | IN | RPAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (x : (
# 15 "funparser.mly"
       (string)
# 786 "funparser.ml"
            ))), _, (e : (Fun.program))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Fun.program) = 
# 56 "funparser.mly"
                                 ( Fun(x, e) )
# 793 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24)
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | AND | COMMA | ELSE | EOF | EQ | GE | GT | IN | LE | LT | MINUS | MOD | NEQ | OR | PLUS | RPAR | SLASH | STAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 72 "funparser.mly"
       ( Mul )
# 824 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 829 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26)
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | AND | COMMA | ELSE | EOF | EQ | GE | GT | IN | LE | LSL | LSR | LT | MINUS | MOD | NEQ | OR | PLUS | RPAR | SLASH | STAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 76 "funparser.mly"
      ( Lsr )
# 856 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 861 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28)
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | AND | COMMA | ELSE | EOF | EQ | GE | GT | IN | LE | LSL | LSR | LT | MINUS | MOD | NEQ | OR | PLUS | RPAR | SLASH | STAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 75 "funparser.mly"
      ( Lsl )
# 888 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 893 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31)
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | AND | COMMA | ELSE | EOF | EQ | GE | GT | IN | LE | LT | MINUS | MOD | NEQ | OR | PLUS | RPAR | SLASH | STAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 73 "funparser.mly"
        ( Div )
# 924 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 929 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33)
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | AND | COMMA | ELSE | EOF | EQ | GE | GT | IN | LE | LT | MINUS | NEQ | OR | PLUS | RPAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 70 "funparser.mly"
       ( Add )
# 966 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 971 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35)
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | AND | COMMA | ELSE | EOF | EQ | GE | GT | IN | LE | LT | MINUS | MOD | NEQ | OR | PLUS | RPAR | SLASH | STAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 74 "funparser.mly"
      ( Rem )
# 1002 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 1007 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37)
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | EQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | GE ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | GT ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | LE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | LT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | NEQ ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | AND | COMMA | ELSE | EOF | IN | OR | RPAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 84 "funparser.mly"
     ( Or )
# 1060 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 1065 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39)
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | AND | COMMA | ELSE | EOF | EQ | GE | GT | IN | LE | LT | NEQ | OR | RPAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 78 "funparser.mly"
      ( Neq )
# 1106 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 1111 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41)
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | AND | COMMA | ELSE | EOF | EQ | GE | GT | IN | LE | LT | MINUS | NEQ | OR | PLUS | RPAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 71 "funparser.mly"
        ( Sub )
# 1148 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 1153 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43)
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | AND | COMMA | ELSE | EOF | EQ | GE | GT | IN | LE | LT | NEQ | OR | RPAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 79 "funparser.mly"
     ( Lt )
# 1194 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 1199 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45)
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | AND | COMMA | ELSE | EOF | EQ | GE | GT | IN | LE | LT | NEQ | OR | RPAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 80 "funparser.mly"
     ( Le )
# 1240 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 1245 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47)
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | AND | COMMA | ELSE | EOF | EQ | GE | GT | IN | LE | LT | NEQ | OR | RPAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 81 "funparser.mly"
     ( Gt )
# 1286 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 1291 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49)
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | AND | COMMA | ELSE | EOF | EQ | GE | GT | IN | LE | LT | NEQ | OR | RPAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 82 "funparser.mly"
     ( Ge )
# 1332 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 1337 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51)
    | MenhirState52 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | AND | COMMA | ELSE | EOF | EQ | GE | GT | IN | LE | LT | NEQ | OR | RPAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 77 "funparser.mly"
     ( Eq )
# 1378 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 1383 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53)
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | EQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | GE ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | GT ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | LE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | LT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | NEQ ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | AND | COMMA | ELSE | EOF | IN | OR | RPAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _1 = () in
            let _v : (Fun.program) = let op = 
# 83 "funparser.mly"
      ( And )
# 1436 "funparser.ml"
             in
            
# 51 "funparser.mly"
                                       ( Binop(op, e1, e2) )
# 1441 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55)
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | EQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | GE ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | GT ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | LE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | LT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | NEQ ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | OR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState56 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BOOL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
            | CST _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
            | FUN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
            | IF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | LET ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | LPAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | MINUS ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | NOT ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56)
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState58 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BOOL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | CST _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | FUN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | IF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | LET ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | LPAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | MINUS ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | NOT ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59)
        | EQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | GE ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | GT ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | LE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | LT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | NEQ ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | OR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58)
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | EQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | GE ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | GT ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | LE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | LT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | NEQ ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | OR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | COMMA | ELSE | EOF | IN | RPAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), _, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))), _), _, (e3 : (Fun.program))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Fun.program) = 
# 57 "funparser.mly"
                                                         ( If(e1, e2, e3) )
# 1652 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60)
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | EQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | GE ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | GT ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState61 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BOOL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | CST _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | FUN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | IF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | LET ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | LPAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | MINUS ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | NOT ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62)
        | LE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | LT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | NEQ ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | OR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61)
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
        | EQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | GE ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | GT ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
        | LE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | LT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | NEQ ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | OR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | COMMA | ELSE | EOF | IN | RPAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), (f : (
# 15 "funparser.mly"
       (string)
# 1783 "funparser.ml"
            ))), _, (xs : (string list))), _, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _7 = () in
            let _5 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Fun.program) = 
# 61 "funparser.mly"
    ( LetRec(f, mk_fun xs e1, e2) )
# 1792 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63)
    | MenhirState66 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | EQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | GE ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | GT ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState67 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BOOL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
            | CST _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
            | FUN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState68
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
            | IF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState68
            | LET ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState68
            | LPAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState68
            | MINUS ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState68
            | NOT ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState68
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68)
        | LE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | LT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | NEQ ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | OR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67)
    | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
        | EQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | GE ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | GT ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
        | LE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | LT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | NEQ ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | OR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | COMMA | ELSE | EOF | IN | RPAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), (f : (
# 15 "funparser.mly"
       (string)
# 1923 "funparser.ml"
            ))), _, (xs : (string list))), _, (e1 : (Fun.program))), _), _, (e2 : (Fun.program))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _1 = () in
            let _v : (Fun.program) = 
# 59 "funparser.mly"
    ( LetIn(f, mk_fun xs e1, e2) )
# 1931 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69)
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState70 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BOOL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
            | CST _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
            | FUN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
            | IF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | LET ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | LPAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | MINUS ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | NOT ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72)
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | EQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | GE ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | GT ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | LE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | LT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | NEQ ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | OR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | RPAR ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70)
    | MenhirState76 | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState75 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BOOL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
            | CST _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
            | FUN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
            | IF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | LET ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | LPAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | MINUS ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | NOT ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76)
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
        | EQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | GE ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | GT ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
        | LE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | LT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | NEQ ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | OR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Fun.program))) = _menhir_stack in
            let _v : (Fun.program list) = 
# 241 "<standard.mly>"
    ( [ x ] )
# 2094 "funparser.ml"
             in
            _menhir_goto_separated_nonempty_list_COMMA_expression_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75)
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
        | EQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | GE ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | GT ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
        | LE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | LT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | NEQ ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | OR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | RPAR ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | BOOL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
        | CST _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState81 in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Fun.program))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 33 "funparser.mly"
      (Fun.program)
# 2170 "funparser.ml"
            ) = 
# 38 "funparser.mly"
                   ( e )
# 2174 "funparser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 33 "funparser.mly"
      (Fun.program)
# 2181 "funparser.ml"
            )) = _v in
            Obj.magic _1
        | EQ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | GE ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | GT ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
        | LE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | LPAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | LSL ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | LSR ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | LT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | MINUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | MOD ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | NEQ ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | OR ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | PLUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | SLASH ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | STAR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81)
    | _ ->
        _menhir_fail ()

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2

and _menhir_reduce26 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (string list) = 
# 211 "<standard.mly>"
    ( [] )
# 2257 "funparser.ml"
     in
    _menhir_goto_list_IDENT_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "funparser.mly"
       (string)
# 2264 "funparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | EQ ->
        _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12

and _menhir_goto_simple_expression : _menhir_env -> 'ttv_tail -> _menhir_state -> (Fun.program) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, (e : (Fun.program))) = _menhir_stack in
        let _1 = () in
        let _v : (Fun.program) = let op = 
# 65 "funparser.mly"
        ( Minus )
# 2292 "funparser.ml"
         in
        
# 50 "funparser.mly"
                              ( Unop(op, e) )
# 2297 "funparser.ml"
         in
        _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 | MenhirState2 | MenhirState76 | MenhirState72 | MenhirState8 | MenhirState68 | MenhirState66 | MenhirState62 | MenhirState15 | MenhirState59 | MenhirState57 | MenhirState16 | MenhirState54 | MenhirState52 | MenhirState50 | MenhirState48 | MenhirState46 | MenhirState44 | MenhirState42 | MenhirState40 | MenhirState38 | MenhirState36 | MenhirState34 | MenhirState32 | MenhirState30 | MenhirState27 | MenhirState25 | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | CST _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | RBRACKET ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, (e : (Fun.program))), (k : (
# 13 "funparser.mly"
       (int)
# 2323 "funparser.ml"
                    ))) = _menhir_stack in
                    let _4 = () in
                    let _2 = () in
                    let _v : (Fun.program) = 
# 54 "funparser.mly"
                                              ( TplGet(e, k) )
# 2330 "funparser.ml"
                     in
                    _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
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
        | AND | BOOL _ | COMMA | CST _ | ELSE | EOF | EQ | GE | GT | IDENT _ | IN | LE | LPAR | LSL | LSR | LT | MINUS | MOD | NEQ | OR | PLUS | RPAR | SLASH | STAR | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Fun.program))) = _menhir_stack in
            let _v : (Fun.program) = 
# 49 "funparser.mly"
                      ( e )
# 2351 "funparser.ml"
             in
            _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState81 | MenhirState78 | MenhirState70 | MenhirState75 | MenhirState67 | MenhirState69 | MenhirState61 | MenhirState63 | MenhirState56 | MenhirState58 | MenhirState60 | MenhirState24 | MenhirState55 | MenhirState39 | MenhirState53 | MenhirState51 | MenhirState49 | MenhirState47 | MenhirState45 | MenhirState41 | MenhirState43 | MenhirState35 | MenhirState37 | MenhirState33 | MenhirState26 | MenhirState31 | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Fun.program))), _, (e2 : (Fun.program))) = _menhir_stack in
        let _v : (Fun.program) = 
# 55 "funparser.mly"
                                     ( App(e1, e2) )
# 2367 "funparser.ml"
         in
        _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, (e : (Fun.program))) = _menhir_stack in
        let _1 = () in
        let _v : (Fun.program) = let op = 
# 66 "funparser.mly"
      ( Not )
# 2378 "funparser.ml"
         in
        
# 50 "funparser.mly"
                              ( Unop(op, e) )
# 2383 "funparser.ml"
         in
        _menhir_goto_expression _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState81 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState76 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState75 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState66 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState64 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState60 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState56 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState52 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | LPAR ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | LPAR ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

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
        | IDENT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | EQ ->
            _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64)
    | REC ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | IDENT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
            | EQ ->
                _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "funparser.mly"
       (string)
# 2783 "funparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (id : (
# 15 "funparser.mly"
       (string)
# 2791 "funparser.ml"
    )) = _v in
    let _v : (Fun.program) = 
# 44 "funparser.mly"
           ( Var(id) )
# 2796 "funparser.ml"
     in
    _menhir_goto_simple_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
        | ARROW ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BOOL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | CST _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | FUN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | IF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | LET ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | LPAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | MINUS ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | NOT ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19)
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

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "funparser.mly"
       (int)
# 2855 "funparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (n : (
# 13 "funparser.mly"
       (int)
# 2863 "funparser.ml"
    )) = _v in
    let _v : (Fun.program) = 
# 42 "funparser.mly"
        ( Cst(n) )
# 2868 "funparser.ml"
     in
    _menhir_goto_simple_expression _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "funparser.mly"
       (bool)
# 2875 "funparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (b : (
# 14 "funparser.mly"
       (bool)
# 2883 "funparser.ml"
    )) = _v in
    let _v : (Fun.program) = 
# 43 "funparser.mly"
         ( Bool(b) )
# 2888 "funparser.ml"
     in
    _menhir_goto_simple_expression _menhir_env _menhir_stack _menhir_s _v

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
# 33 "funparser.mly"
      (Fun.program)
# 2907 "funparser.ml"
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
    | BOOL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | CST _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | FUN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LPAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | MINUS ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NOT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 269 "<standard.mly>"
  

# 2947 "funparser.ml"
