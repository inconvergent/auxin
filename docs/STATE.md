#### STATE:AWITH

```
 ; STATE:AWITH
 ;   [symbol]
 ; 
 ; AWITH names a macro:
 ;   Lambda-list: ((ST K &KEY DEFAULT) &BODY BODY)
 ;   Documentation:
 ;     access state[key] as state:it,
 ;        the final form of body is assigned back to state[key]
 ;   Source file: /data/x/auxin/src/state.lisp
```

#### STATE:IT

```
:missing:todo:

 ; STATE:IT
 ;   [symbol]
```

#### STATE:LGET

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
 ;   Source file: /data/x/auxin/src/state.lisp
```

#### STATE:LSET

```
 ; STATE:LSET
 ;   [symbol]
 ; 
 ; LSET names a compiled function:
 ;   Lambda-list: (ST KEYS V)
 ;   Derived type: (FUNCTION (STATE::STATE LIST T) (VALUES NULL &OPTIONAL))
 ;   Documentation:
 ;     set keys of st to v. returns keys
 ;   Source file: /data/x/auxin/src/state.lisp
```

#### STATE:MAKE

```
:missing:todo:

 ; STATE:MAKE
 ;   [symbol]
 ; 
 ; MAKE names a compiled function:
 ;   Lambda-list: ()
 ;   Derived type: (FUNCTION NIL (VALUES STATE::STATE &OPTIONAL))
 ;   Source file: /data/x/auxin/src/state.lisp
```

#### STATE:SGET

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
 ;   Source file: /data/x/auxin/src/state.lisp
 ; 
 ; (SETF SGET) has setf-expansion: STATE::-SSET
```

#### STATE:TO-LIST

```
 ; STATE:TO-LIST
 ;   [symbol]
 ; 
 ; TO-LIST names a compiled function:
 ;   Lambda-list: (ST)
 ;   Derived type: (FUNCTION (STATE::STATE) (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     get state as alist
 ;   Source file: /data/x/auxin/src/state.lisp
```

#### STATE:WITH

```
:missing:todo:

 ; STATE:WITH
 ;   [symbol]
```

