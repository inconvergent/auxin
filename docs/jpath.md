## `JPATH`
```
:missing:

 ; JPATH:JPATH
 ;   [symbol]
 ; 
 ; JPATH names a compiled function:
 ;   Lambda-list: (PATH W &KEY (REP 3) CLOSED (LIMITS *LIMITS*))
 ;   Derived type: (FUNCTION
 ;                  ((SIMPLE-ARRAY SINGLE-FLOAT) SINGLE-FLOAT &KEY
 ;                   (:REP FIXNUM) (:CLOSED BOOLEAN) (:LIMITS T))
 ;                  (VALUES T &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/draw/jpath.lisp
```

## `MAKE-LIMITS`
```
:missing:

 ; JPATH:MAKE-LIMITS
 ;   [symbol]
 ; 
 ; MAKE-LIMITS names a macro:
 ;   Lambda-list: (A B C)
 ;   Source file: /home/anders/x/auxin/src/draw/jpath.lisp
```

## `PATH->DIAGONALS`
```
 ; JPATH:PATH->DIAGONALS
 ;   [symbol]
 ; 
 ; PATH->DIAGONALS names a compiled function:
 ;   Lambda-list: (PATH W &KEY CLOSED (LIMITS *LIMITS*))
 ;   Derived type: (FUNCTION
 ;                  ((SIMPLE-ARRAY SINGLE-FLOAT) SINGLE-FLOAT &KEY
 ;                   (:CLOSED BOOLEAN) (:LIMITS T))
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     return (orientation line) for every point in path. lerp-ing along lines will
 ;     return controll points. lerp direction should be flipped when orientation is
 ;     nil. sharp or chamfered points correspond to two lines
 ;   Source file: /home/anders/x/auxin/src/draw/jpath.lisp
```

## `PATH->JOINTS`
```
 ; JPATH:PATH->JOINTS
 ;   [symbol]
 ; 
 ; PATH->JOINTS names a compiled function:
 ;   Lambda-list: (PATH W* &KEY CLOSED &AUX (W (* 0.5 W*))
 ;                 (N (ROUND (LENGTH PATH) 2)))
 ;   Derived type: (FUNCTION
 ;                  ((SIMPLE-ARRAY SINGLE-FLOAT) SINGLE-FLOAT &KEY
 ;                   (:CLOSED BOOLEAN))
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     joints contain information about how to offset around points in path.
 ;   Source file: /home/anders/x/auxin/src/draw/jpath.lisp
```

