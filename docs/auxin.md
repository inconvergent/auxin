## `*EPS*`
```
:missing:

 ; AUXIN:*EPS*
 ;   [symbol]
 ; 
 ; *EPS* names a special variable:
 ;   Declared type: SINGLE-FLOAT
 ;   Value: 5.960465e-8
```

## `*OPT*`
```
:missing:

 ; AUXIN:*OPT*
 ;   [symbol]
 ; 
 ; *OPT* names a special variable:
 ;   Value: (OPTIMIZE (SAFETY 1) (SPEED 3) (DEBUG 1) (SPACE 3))
```

## `ABBREV`
```
:missing:

 ; VEQ::ABBREV
 ;   [symbol]
 ; 
 ; ABBREV names a macro:
 ;   Lambda-list: (SHORT LONG)
 ;   Source file: /home/anders/x/veq/src/generic-utils.lisp
```

## `AIF`
```
:missing:

 ; VEQ::AIF
 ;   [symbol]
 ; 
 ; AIF names a macro:
 ;   Lambda-list: (TEST-FORM THEN-FORM &OPTIONAL ELSE-FORM)
 ;   Source file: /home/anders/x/veq/src/generic-utils.lisp
```

## `ANIMATE`
```
:missing:

 ; AUXIN:ANIMATE
 ;   [symbol]
 ; 
 ; ANIMATE names a macro:
 ;   Lambda-list: (ANI)
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `APPEND-NUMBER`
```
 ; AUXIN:APPEND-NUMBER
 ;   [symbol]
 ; 
 ; APPEND-NUMBER names a compiled function:
 ;   Lambda-list: (FN I)
 ;   Derived type: (FUNCTION (STRING FIXNUM)
 ;                  (VALUES SIMPLE-STRING &OPTIONAL))
 ;   Documentation:
 ;     append number i to fn with zero padding.
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `AWF`
```
 ; VEQ::AWF
 ;   [symbol]
 ; 
 ; AWF names a macro:
 ;   Lambda-list: (&REST ARGS)
 ;   Documentation:
 ;     alias: FLATTEN
 ; 
 ;   Source file: /home/anders/x/veq/src/generic-utils.lisp
```

## `AWG`
```
 ; VEQ::AWG
 ;   [symbol]
 ; 
 ; AWG names a macro:
 ;   Lambda-list: (&REST ARGS)
 ;   Documentation:
 ;     alias: WITH-GENSYMS
 ; 
 ;   Source file: /home/anders/x/veq/src/generic-utils.lisp
```

## `CMD-ARGS`
```
:missing:

 ; AUXIN:CMD-ARGS
 ;   [symbol]
 ; 
 ; CMD-ARGS names a compiled function:
 ;   Lambda-list: ()
 ;   Derived type: (FUNCTION NIL (VALUES T &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `D?`
```
:missing:

 ; AUXIN:D?
 ;   [symbol]
 ; 
 ; D? names a compiled function:
 ;   Lambda-list: (F)
 ;   Derived type: (FUNCTION (T) (VALUES &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `DEFINE-STRUCT-LOAD-FORM`
```
 ; AUXIN:DEFINE-STRUCT-LOAD-FORM
 ;   [symbol]
 ; 
 ; DEFINE-STRUCT-LOAD-FORM names a macro:
 ;   Lambda-list: (STRUCT-NAME)
 ;   Documentation:
 ;     allow struct to be dumped to fasl files.
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `DSB`
```
 ; VEQ:DSB
 ;   [symbol]
 ; 
 ; DSB names a macro:
 ;   Lambda-list: (&REST ARGS)
 ;   Documentation:
 ;     alias: DESTRUCTURING-BIND
 ; 
 ;   Source file: /home/anders/x/veq/src/generic-utils.lisp
```

## `ENSURE-FILENAME`
```
:missing:

 ; AUXIN:ENSURE-FILENAME
 ;   [symbol]
 ; 
 ; ENSURE-FILENAME names a compiled function:
 ;   Lambda-list: (FN &OPTIONAL (POSTFIX ) (SILENT NIL))
 ;   Derived type: (FUNCTION (T &OPTIONAL T T)
 ;                  (VALUES SIMPLE-STRING &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `ENSURE-VECTOR`
```
:missing:

 ; AUXIN:ENSURE-VECTOR
 ;   [symbol]
 ; 
 ; ENSURE-VECTOR names a compiled function:
 ;   Lambda-list: (O &KEY (TYPE T))
 ;   Derived type: (FUNCTION (SEQUENCE &KEY (:TYPE T)) *)
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `EV`
```
 ; AUXIN:EV
 ;   [symbol]
 ; 
 ; EV names a macro:
 ;   Lambda-list: (&REST ARGS)
 ;   Documentation:
 ;     alias: ENSURE-VECTOR
 ; 
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `GI`
```
:missing:

 ; AUXIN:GI
 ;   [symbol]
 ; 
 ; GI names a macro:
 ;   Lambda-list: (V)
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `I?`
```
:missing:

 ; AUXIN:I?
 ;   [symbol]
 ; 
 ; I? names a compiled function:
 ;   Lambda-list: (F)
 ;   Derived type: (FUNCTION (T) (VALUES &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `INTERNAL-PATH-STRING`
```
:missing:

 ; AUXIN:INTERNAL-PATH-STRING
 ;   [symbol]
 ; 
 ; INTERNAL-PATH-STRING names a compiled function:
 ;   Lambda-list: (PATH &OPTIONAL (PKG AUXIN))
 ;   Derived type: (FUNCTION (STRING &OPTIONAL T)
 ;                  (VALUES (OR SIMPLE-STRING NULL) &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `IT`
```
:missing:

 ; AUXIN:IT
 ;   [symbol]
```

## `ITER-TIMER`
```
:missing:

 ; AUXIN:ITER-TIMER
 ;   [symbol]
 ; 
 ; ITER-TIMER names a compiled function:
 ;   Lambda-list: (TOT &KEY (INT 1) (S T) (PREFX (LAMBDA (&REST REST) ))
 ;                 (INFOFX
 ;                  (LAMBDA (&REST REST) (DECLARE (IGNORABLE REST)) )))
 ;   Derived type: (FUNCTION
 ;                  ((UNSIGNED-BYTE 32) &KEY (:INT (UNSIGNED-BYTE 32))
 ;                   (:S T) (:PREFX T) (:INFOFX FUNCTION))
 ;                  (VALUES FUNCTION &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `KI`
```
:missing:

 ; AUXIN:KI
 ;   [symbol]
 ; 
 ; KI names a macro:
 ;   Lambda-list: (V)
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `KV`
```
:missing:

 ; AUXIN:KV
 ;   [symbol]
 ; 
 ; KV names a compiled function:
 ;   Lambda-list: (&REST ARGS)
 ;   Derived type: (FUNCTION * (VALUES SYMBOL &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `LAST*`
```
:missing:

 ; AUXIN:LAST*
 ;   [symbol]
 ; 
 ; LAST* names a compiled function:
 ;   Lambda-list: (A)
 ;   Derived type: (FUNCTION (T) (VALUES T &OPTIONAL))
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `LST>N`
```
 ; AUXIN:LST>N
 ;   [symbol]
 ; 
 ; LST>N names a compiled function:
 ;   Lambda-list: (L N)
 ;   Derived type: (FUNCTION (LIST (UNSIGNED-BYTE 32))
 ;                  (VALUES BOOLEAN &OPTIONAL))
 ;   Documentation:
 ;     is list, l, longer than n?
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `LVEXTEND`
```
 ; AUXIN:LVEXTEND
 ;   [symbol]
 ; 
 ; LVEXTEND names a compiled function:
 ;   Lambda-list: (X V)
 ;   Derived type: (FUNCTION (SEQUENCE VECTOR) (VALUES NULL &OPTIONAL))
 ;   Documentation:
 ;     extend v with all items in x.
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `MAKE-ADJUSTABLE-VECTOR`
```
:missing:

 ; AUXIN:MAKE-ADJUSTABLE-VECTOR
 ;   [symbol]
 ; 
 ; MAKE-ADJUSTABLE-VECTOR names a compiled function:
 ;   Lambda-list: (&KEY INIT (TYPE T) (SIZE 128))
 ;   Derived type: (FUNCTION (&KEY (:INIT T) (:TYPE T) (:SIZE T))
 ;                  (VALUES (AND VECTOR (NOT SIMPLE-ARRAY)) &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `MAKE-ANIMATION`
```
:missing:

 ; AUXIN:MAKE-ANIMATION
 ;   [symbol]
 ; 
 ; MAKE-ANIMATION names a macro:
 ;   Lambda-list: ((ANI) &BODY BODY)
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `ME`
```
:missing:

 ; AUXIN:ME
 ;   [symbol]
 ; 
 ; ME names a macro:
 ;   Lambda-list: (V)
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `MKSTR`
```
:missing:

 ; AUXIN:MKSTR
 ;   [symbol]
 ; 
 ; MKSTR names a compiled function:
 ;   Lambda-list: (&REST ARGS)
 ;   Derived type: (FUNCTION * (VALUES SIMPLE-STRING &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `MMSS`
```
:missing:

 ; AUXIN:MMSS
 ;   [symbol]
 ; 
 ; MMSS names a compiled function:
 ;   Lambda-list: (I)
 ;   Derived type: (FUNCTION (SINGLE-FLOAT)
 ;                  (VALUES SIMPLE-STRING &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `MVB`
```
 ; VEQ:MVB
 ;   [symbol]
 ; 
 ; MVB names a macro:
 ;   Lambda-list: (&REST ARGS)
 ;   Documentation:
 ;     alias: MULTIPLE-VALUE-BIND
 ; 
 ;   Source file: /home/anders/x/veq/src/generic-utils.lisp
```

## `MVC`
```
 ; VEQ:MVC
 ;   [symbol]
 ; 
 ; MVC names a macro:
 ;   Lambda-list: (&REST ARGS)
 ;   Documentation:
 ;     alias: MULTIPLE-VALUE-CALL
 ; 
 ;   Source file: /home/anders/x/veq/src/generic-utils.lisp
```

## `NOW`
```
:missing:

 ; AUXIN:NOW
 ;   [symbol]
 ; 
 ; NOW names a compiled function:
 ;   Lambda-list: (&OPTIONAL (T0 0.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT)
 ;                  (VALUES (SINGLE-FLOAT 0.0) &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `NUMSHOW`
```
:missing:

 ; AUXIN:NUMSHOW
 ;   [symbol]
 ; 
 ; NUMSHOW names a compiled function:
 ;   Lambda-list: (A &KEY (TEN 6) (PREC 6))
 ;   Derived type: (FUNCTION (NUMBER &KEY (:TEN T) (:PREC T))
 ;                  (VALUES SIMPLE-STRING &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `PRINT-EVERY`
```
:missing:

 ; AUXIN:PRINT-EVERY
 ;   [symbol]
 ; 
 ; PRINT-EVERY names a compiled function:
 ;   Lambda-list: (I &OPTIONAL (N 1))
 ;   Derived type: (FUNCTION (FIXNUM &OPTIONAL FIXNUM)
 ;                  (VALUES NULL &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `PSH`
```
 ; AUXIN:PSH
 ;   [symbol]
 ; 
 ; PSH names a macro:
 ;   Lambda-list: (A L)
 ;   Documentation:
 ;     push a to l, return a. a is evaluated only once.
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `PSYMB`
```
:missing:

 ; AUXIN:PSYMB
 ;   [symbol]
 ; 
 ; PSYMB names a compiled function:
 ;   Lambda-list: (PACKAGE &REST ARGS)
 ;   Derived type: (FUNCTION (T &REST T) (VALUES SYMBOL &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `REREAD`
```
:missing:

 ; AUXIN:REREAD
 ;   [symbol]
 ; 
 ; REREAD names a compiled function:
 ;   Lambda-list: (&REST ARGS)
 ;   Derived type: (FUNCTION * (VALUES T &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `SHOW-HT`
```
:missing:

 ; AUXIN:SHOW-HT
 ;   [symbol]
 ; 
 ; SHOW-HT names a compiled function:
 ;   Lambda-list: (HT)
 ;   Derived type: (FUNCTION (T) (VALUES T &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `SMALL-IND`
```
:missing:

 ; AUXIN:SMALL-IND
 ;   [symbol]
 ; 
 ; SMALL-IND names a type-specifier:
 ;   Lambda-list: (&OPTIONAL (SIZE 30000))
 ;   Expansion: (INTEGER 0 30000)
```

## `SPLIT`
```
 ; AUXIN:SPLIT
 ;   [symbol]
 ; 
 ; SPLIT names a compiled function:
 ;   Lambda-list: (S C)
 ;   Derived type: (FUNCTION (STRING T) *)
 ;   Documentation:
 ;     split s at c
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `STRING-LIST-CONCAT`
```
:missing:

 ; AUXIN:STRING-LIST-CONCAT
 ;   [symbol]
 ; 
 ; STRING-LIST-CONCAT names a compiled function:
 ;   Lambda-list: (L)
 ;   Derived type: (FUNCTION (LIST) (VALUES SIMPLE-STRING &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `SYMB`
```
:missing:

 ; AUXIN:SYMB
 ;   [symbol]
 ; 
 ; SYMB names a compiled function:
 ;   Lambda-list: (&REST ARGS)
 ;   Derived type: (FUNCTION * (VALUES SYMBOL &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `TAV`
```
 ; AUXIN:TAV
 ;   [symbol]
 ; 
 ; TAV names a macro:
 ;   Lambda-list: (&REST ARGS)
 ;   Documentation:
 ;     alias: TO-ADJUSTABLE-VECTOR
 ; 
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `TERMINATE`
```
:missing:

 ; AUXIN:TERMINATE
 ;   [symbol]
 ; 
 ; TERMINATE names a compiled function:
 ;   Lambda-list: (STATUS &OPTIONAL SILENT)
 ;   Derived type: (FUNCTION (T &OPTIONAL T) *)
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `TL`
```
 ; AUXIN:TL
 ;   [symbol]
 ; 
 ; TL names a macro:
 ;   Lambda-list: (&REST ARGS)
 ;   Documentation:
 ;     alias: TO-LIST
 ; 
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `TO-ADJUSTABLE-VECTOR`
```
:missing:

 ; AUXIN:TO-ADJUSTABLE-VECTOR
 ;   [symbol]
 ; 
 ; TO-ADJUSTABLE-VECTOR names a compiled function:
 ;   Lambda-list: (INIT &KEY (TYPE T))
 ;   Derived type: (FUNCTION (SEQUENCE &KEY (:TYPE T))
 ;                  (VALUES (AND VECTOR (NOT SIMPLE-ARRAY)) &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `TO-LIST`
```
:missing:

 ; AUXIN:TO-LIST
 ;   [symbol]
 ; 
 ; TO-LIST names a compiled function:
 ;   Lambda-list: (A)
 ;   Derived type: (FUNCTION (SEQUENCE) (VALUES LIST &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `TO-VECTOR`
```
:missing:

 ; AUXIN:TO-VECTOR
 ;   [symbol]
 ; 
 ; TO-VECTOR names a compiled function:
 ;   Lambda-list: (INIT &KEY (TYPE T))
 ;   Derived type: (FUNCTION (LIST &KEY (:TYPE T))
 ;                  (VALUES (SIMPLE-ARRAY * (*)) &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `TV`
```
 ; AUXIN:TV
 ;   [symbol]
 ; 
 ; TV names a macro:
 ;   Lambda-list: (&REST ARGS)
 ;   Documentation:
 ;     alias: TO-VECTOR
 ; 
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `UNDUP`
```
:missing:

 ; AUXIN:UNDUP
 ;   [symbol]
 ; 
 ; UNDUP names a compiled function:
 ;   Lambda-list: (E)
 ;   Derived type: (FUNCTION (T) (VALUES SEQUENCE &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `V?`
```
:missing:

 ; AUXIN:V?
 ;   [symbol]
 ; 
 ; V? names a compiled function:
 ;   Lambda-list: (&OPTIONAL (SILENT T) &AUX
 ;                 (V
 ;                  (SLOT-VALUE (FIND-SYSTEM (QUOTE AUXIN))
 ;                              (QUOTE VERSION))))
 ;   Derived type: (FUNCTION (&OPTIONAL T) (VALUES T &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `VECTOR-FIRST`
```
:missing:

 ; AUXIN:VECTOR-FIRST
 ;   [symbol]
 ; 
 ; VECTOR-FIRST names a compiled function:
 ;   Lambda-list: (A)
 ;   Derived type: (FUNCTION (VECTOR) (VALUES T &OPTIONAL))
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `VECTOR-LAST`
```
:missing:

 ; AUXIN:VECTOR-LAST
 ;   [symbol]
 ; 
 ; VECTOR-LAST names a compiled function:
 ;   Lambda-list: (A)
 ;   Derived type: (FUNCTION (VECTOR) (VALUES T &OPTIONAL))
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `VEXTEND`
```
 ; AUXIN:VEXTEND
 ;   [symbol]
 ; 
 ; VEXTEND names a macro:
 ;   Lambda-list: (&REST ARGS)
 ;   Documentation:
 ;     alias: VECTOR-PUSH-EXTEND
 ; 
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `VL`
```
 ; AUXIN:VL
 ;   [symbol]
 ; 
 ; VL names a macro:
 ;   Lambda-list: (&REST ARGS)
 ;   Documentation:
 ;     alias: VECTOR-LAST
 ; 
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `WHEEL`
```
:missing:

 ; AUXIN:WHEEL
 ;   [symbol]
 ; 
 ; WHEEL names a compiled function:
 ;   Lambda-list: (S)
 ;   Derived type: (FUNCTION (SINGLE-FLOAT)
 ;                  (VALUES (SIMPLE-ARRAY CHARACTER (1)) &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `WITH-FAST-STACK`
```
:missing:

 ; AUXIN:WITH-FAST-STACK
 ;   [symbol]
 ; 
 ; WITH-FAST-STACK names a macro:
 ;   Lambda-list: ((SYM &KEY (TYPE (QUOTE FIXNUM)) (N 1000) (V 0)
 ;                  (SAFE-Z 100))
 ;                 &REST BODY)
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

## `WITH-STRUCT`
```
:missing:

 ; AUXIN:WITH-STRUCT
 ;   [symbol]
 ; 
 ; WITH-STRUCT names a macro:
 ;   Lambda-list: ((NAME . FIELDS) STRUCT &BODY BODY)
 ;   Source file: /home/anders/x/auxin/src/utils.lisp
```

