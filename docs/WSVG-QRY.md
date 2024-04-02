#### WSVG/QRY:SELECTORS

```
 ; WSVG/QRY:SELECTORS
 ;   [symbol]
 ; 
 ; SELECTORS names a macro:
 ;   Lambda-list: ((G V WSVG &KEY (SYM (GENSYM $))) &BODY BODY)
 ;   Documentation:
 ;     use grph datalog selectors to draw directly from grph:grph g, and xgrph:pos v
 ;     (selectors (g v wsvg)
 ;       (.&es ?x ?y (?x :path ?y) (rnd:prob 0.1 (.&path :sw 6.75 :so 0.85)))
 ;       (.&vs ?x (and (or (?x :path ?y) (?y _ ?x))
 ;                   (% (<= (grph:num-either g ?x) 3)))
 ;                (.&circ 8f0  :fill :black :so 0.8 :fo 0.8)))
 ;   Source file: /data/x/auxin/src/draw/svg-qry.lisp
```

