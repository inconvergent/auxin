## `ADAPTIVE-POS`
```
:missing:

 ; BZSPL:ADAPTIVE-POS
 ;   [symbol]
 ; 
 ; ADAPTIVE-POS names a compiled function:
 ;   Lambda-list: (BZ &OPTIONAL (LIM *LIM*))
 ;   Derived type: (FUNCTION (BZSPL::BZSPL &OPTIONAL SINGLE-FLOAT) *)
 ;   Source file: /data/x/auxin/src/draw/bzspl.lisp
```

## `LEN`
```
:missing:

 ; BZSPL:LEN
 ;   [symbol]
 ; 
 ; LEN names a compiled function:
 ;   Lambda-list: (BZ &OPTIONAL (LIM *LIM*))
 ;   Derived type: (FUNCTION (BZSPL::BZSPL &OPTIONAL T)
 ;                  (VALUES (SINGLE-FLOAT 0.0) &OPTIONAL))
 ;   Source file: /data/x/auxin/src/draw/bzspl.lisp
```

## `MAKE`
```
:missing:

 ; BZSPL:MAKE
 ;   [symbol]
 ; 
 ; MAKE names a compiled function:
 ;   Lambda-list: (PTS &KEY CLOSED &AUX (N (2$NUM PTS)))
 ;   Derived type: (FUNCTION
 ;                  ((SIMPLE-ARRAY SINGLE-FLOAT) &KEY (:CLOSED BOOLEAN))
 ;                  (VALUES BZSPL::BZSPL &OPTIONAL))
 ;   Source file: /data/x/auxin/src/draw/bzspl.lisp
```

## `POS`
```
:missing:

 ; BZSPL:POS
 ;   [symbol]
 ; 
 ; POS names a compiled function:
 ;   Lambda-list: (BZ X)
 ;   Derived type: (FUNCTION (BZSPL::BZSPL SINGLE-FLOAT)
 ;                  (VALUES SINGLE-FLOAT SINGLE-FLOAT &OPTIONAL))
 ;   Source file: /data/x/auxin/src/draw/bzspl.lisp
```

## `POS*`
```
:missing:

 ; BZSPL:POS*
 ;   [symbol]
 ; 
 ; POS* names a compiled function:
 ;   Lambda-list: (B XX)
 ;   Derived type: (FUNCTION (BZSPL::BZSPL LIST)
 ;                  (VALUES (SIMPLE-ARRAY SINGLE-FLOAT (*)) &OPTIONAL))
 ;   Source file: /data/x/auxin/src/draw/bzspl.lisp
```

## `RNDPOS`
```
:missing:

 ; BZSPL:RNDPOS
 ;   [symbol]
 ; 
 ; RNDPOS names a compiled function:
 ;   Lambda-list: (B N &KEY ORDER)
 ;   Derived type: (FUNCTION
 ;                  (BZSPL::BZSPL (UNSIGNED-BYTE 32) &KEY (:ORDER T)) *)
 ;   Source file: /data/x/auxin/src/draw/bzspl.lisp
```

