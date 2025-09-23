## `AWITH`
```
 ; STATE:AWITH
 ;   [symbol]
 ; 
 ; AWITH names a macro:
 ;   Lambda-list: ((ST K &KEY DEFAULT) &BODY BODY)
 ;   Documentation:
 ;     access state[key] as state:it. final form of body is assigned to state[key]
 ;   Source file: /home/anders/x/auxin/src/state.lisp
```

## `IT`
```
:missing:

 ; STATE:IT
 ;   [symbol]
```

## `LGET`
```
 ; STATE:LGET
 ;   [symbol]
 ; 
 ; LGET names a compiled function:
 ;   Lambda-list: (ST KEYS &KEY DEFAULT)
 ;   Derived type: (FUNCTION (STATE::STATE LIST &KEY (:DEFAULT T))
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     get keys of state (or default)
 ;   Source file: /home/anders/x/auxin/src/state.lisp
```

## `LSET`
```
 ; STATE:LSET
 ;   [symbol]
 ; 
 ; LSET names a compiled function:
 ;   Lambda-list: (ST KEYS V)
 ;   Derived type: (FUNCTION (STATE::STATE LIST T) (VALUES NULL &OPTIONAL))
 ;   Documentation:
 ;     set keys of st to v. returns keys
 ;   Source file: /home/anders/x/auxin/src/state.lisp
```

## `MAKE`
```
:missing:

 ; STATE:MAKE
 ;   [symbol]
 ; 
 ; MAKE names a compiled function:
 ;   A constructor for STATE::STATE
 ;   Lambda-list: ()
 ;   Derived type: (FUNCTION NIL (VALUES STATE::STATE &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/state.lisp
```

## `SGET`
```
 ; STATE:SGET
 ;   [symbol]
 ; 
 ; SGET names a compiled function:
 ;   Lambda-list: (ST K &KEY DEFAULT)
 ;   Derived type: (FUNCTION (STATE::STATE T &KEY (:DEFAULT T))
 ;                  (VALUES T BOOLEAN &OPTIONAL))
 ;   Documentation:
 ;     get k of state (or default)
 ;   Source file: /home/anders/x/auxin/src/state.lisp
 ; 
 ; (SETF SGET) has setf-expansion: STATE::-SSET
```

## `TO-LIST`
```
 ; STATE:TO-LIST
 ;   [symbol]
 ; 
 ; TO-LIST names a compiled function:
 ;   Lambda-list: (ST)
 ;   Derived type: (FUNCTION (STATE::STATE) (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     get state as alist
 ;   Source file: /home/anders/x/auxin/src/state.lisp
```

## `WITH`
```
:missing:

 ; STATE:WITH
 ;   [symbol]
```

