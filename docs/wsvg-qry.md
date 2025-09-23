## `GRPH-DRAW`
```
 ; WSVG/QRY:GRPH-DRAW
 ;   [symbol]
 ; 
 ; GRPH-DRAW names a macro:
 ;   Lambda-list: ((G V WSVG &KEY (SYM (GENSYM $))) &BODY BODY)
 ;   Documentation:
 ;     use grph datalog queries to draw directly from grph:grph g, and xgrph:pos v
 ;     (grph-draw (g v wsvg)
 ;       (.&es ?x ?y (?x :path ?y) (rnd:prob 0.1 (.&path :sw 6.75 :so 0.85)))
 ;       (.&vs ?x (and (or (?x :path ?y) (?y _ ?x))
 ;                   (% (<= (grph:num-either g ?x) 3)))
 ;                (.&circ 8f0  :fill :black :so 0.8 :fo 0.8)))
 ;     
 ;     see proc-grph-draw
 ; 
 ;   Source file: /home/anders/x/auxin/src/draw/svg-qry.lisp
```

## `PROC-GRPH-DRAW`
```
:missing:

 ; WSVG/QRY:PROC-GRPH-DRAW
 ;   [symbol]
 ; 
 ; PROC-GRPH-DRAW names a compiled function:
 ;   Lambda-list: (BODY CONF &AUX (G (GK CONF GSYM)) ($ (GK CONF $SYM))
 ;                 (C (GK CONF CLOSED-SYM)))
 ;   Derived type: (FUNCTION (T T) (VALUES T &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/draw/svg-qry.lisp
```

