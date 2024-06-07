## `@CLOSED`
```
:missing:

 ; PTH:@CLOSED
 ;   [symbol]
 ; 
 ; @CLOSED names a compiled function:
 ;   Lambda-list: (PTH)
 ;   Derived type: (FUNCTION (PTH:PTH) (VALUES BOOLEAN &OPTIONAL))
 ;   Source file: /data/x/auxin/src/draw/path.lisp
```

## `@DIM`
```
:missing:

 ; PTH:@DIM
 ;   [symbol]
 ; 
 ; @DIM names a compiled function:
 ;   Lambda-list: (PTH)
 ;   Derived type: (FUNCTION (PTH:PTH)
 ;                  (VALUES (UNSIGNED-BYTE 32) &OPTIONAL))
 ;   Source file: /data/x/auxin/src/draw/path.lisp
```

## `@LEN`
```
 ; PTH:@LEN
 ;   [symbol]
 ; 
 ; @LEN names a compiled function:
 ;   Lambda-list: (PTH)
 ;   Derived type: (FUNCTION (PTH:PTH) (VALUES SINGLE-FLOAT &OPTIONAL))
 ;   Documentation:
 ;     the total length of pth
 ;   Source file: /data/x/auxin/src/draw/path.lisp
```

## `@N`
```
:missing:

 ; PTH:@N
 ;   [symbol]
 ; 
 ; @N names a compiled function:
 ;   Lambda-list: (PTH)
 ;   Derived type: (FUNCTION (PTH:PTH)
 ;                  (VALUES (UNSIGNED-BYTE 32) &OPTIONAL))
 ;   Source file: /data/x/auxin/src/draw/path.lisp
```

## `@NS`
```
:missing:

 ; PTH:@NS
 ;   [symbol]
 ; 
 ; @NS names a compiled function:
 ;   Lambda-list: (PTH)
 ;   Derived type: (FUNCTION (PTH:PTH)
 ;                  (VALUES (UNSIGNED-BYTE 32) &OPTIONAL))
 ;   Source file: /data/x/auxin/src/draw/path.lisp
```

## `@PTS`
```
 ; PTH:@PTS
 ;   [symbol]
 ; 
 ; @PTS names a compiled function:
 ;   Lambda-list: (PTH &OPTIONAL CLOSED)
 ;   Derived type: (FUNCTION (PTH:PTH &OPTIONAL BOOLEAN) *)
 ;   Documentation:
 ;     returns all points in pth
 ;   Source file: /data/x/auxin/src/draw/path.lisp
```

## `ARC`
```
 ; PTH:ARC
 ;   [symbol]
 ; 
 ; ARC names a compiled function:
 ;   Lambda-list: (R A B &KEY (RS 1.0) CCW)
 ;   Derived type: (FUNCTION
 ;                  (SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT &KEY
 ;                   (:RS SINGLE-FLOAT) (:CCW T))
 ;                  (VALUES T &OPTIONAL))
 ;   Documentation:
 ;     arc from a to b with rad r
 ;   Source file: /data/x/auxin/src/draw/path.lisp
```

## `LPOS`
```
 ; PTH:LPOS
 ;   [symbol]
 ; 
 ; LPOS names a compiled function:
 ;   Lambda-list: (PTH A B)
 ;   Derived type: (FUNCTION (PTH:PTH SINGLE-FLOAT SINGLE-FLOAT) *)
 ;   Documentation:
 ;     get all points [(pos a) ... (pos b)].
 ;     if pth is closed and b < a it will move through (pos 0)
 ;   Source file: /data/x/auxin/src/draw/path.lisp
```

## `MAKE`
```
 ; PTH:MAKE
 ;   [symbol]
 ; 
 ; MAKE names a compiled function:
 ;   Lambda-list: (PTS &KEY (DIM 2) CLOSED)
 ;   Derived type: (FUNCTION
 ;                  ((SIMPLE-ARRAY SINGLE-FLOAT) &KEY
 ;                   (:DIM (UNSIGNED-BYTE 32)) (:CLOSED BOOLEAN))
 ;                  (VALUES PTH:PTH &OPTIONAL))
 ;   Documentation:
 ;     initiate a pth from pts
 ;   Source file: /data/x/auxin/src/draw/path.lisp
```

## `POS`
```
 ; PTH:POS
 ;   [symbol]
 ; 
 ; POS names a compiled function:
 ;   Lambda-list: (PTH &OPTIONAL (A 0.0))
 ;   Derived type: (FUNCTION (PTH:PTH &OPTIONAL SINGLE-FLOAT)
 ;                  (VALUES (SIMPLE-ARRAY SINGLE-FLOAT) (UNSIGNED-BYTE 32)
 ;                          SINGLE-FLOAT &OPTIONAL))
 ;   Documentation:
 ;     get the coordinate of the linear interpolation along pth where 0.0 <= a <= 1.0.
 ;     if pth is closed (pos a) equals (pos b).
 ;   Source file: /data/x/auxin/src/draw/path.lisp
```

## `PRT`
```
:missing:

 ; PTH:PRT
 ;   [symbol]
 ; 
 ; PRT names a compiled function:
 ;   Lambda-list: (PTH &OPTIONAL (N (PTH-N PTH)))
 ;   Derived type: (FUNCTION (PTH:PTH &OPTIONAL T)
 ;                  (VALUES PTH:PTH &OPTIONAL))
 ;   Source file: /data/x/auxin/src/draw/path.lisp
```

## `PTH`
```
:missing:

 ; PTH:PTH
 ;   [symbol]
 ; 
 ; PTH names the structure-class #<STRUCTURE-CLASS PTH:PTH>:
 ;   Class precedence-list: PTH:PTH, STRUCTURE-OBJECT, SB-PCL::SLOT-OBJECT,
 ;                          T
 ;   Direct superclasses: STRUCTURE-OBJECT
 ;   No subclasses.
 ;   Slots:
 ;     PTH::N
 ;       Type: VEQ:PN
 ;       Initform: 2
 ;     PTH::NS
 ;       Type: VEQ:PN
 ;       Initform: 1
 ;     PTH::DIM
 ;       Type: VEQ:PN
 ;       Initform: 2
 ;     PTH::CLOSED
 ;       Type: BOOLEAN
 ;       Initform: NIL
 ;     PTH::VPTS
 ;       Type: VEQ:FVEC
 ;       Initform: NIL
 ;     PTH::WS
 ;       Type: VEQ:FVEC
 ;       Initform: NIL
 ;     PTH::LEN
 ;       Type: VEQ:FF (unboxed)
 ;       Initform: 0.0
```

## `STIPPLE`
```
 ; PTH:STIPPLE
 ;   [symbol]
 ; 
 ; STIPPLE names a compiled function:
 ;   Lambda-list: (P &OPTIONAL (S 2.0) (G S) &AUX (L (+ S G)))
 ;   Derived type: (FUNCTION (T &OPTIONAL SINGLE-FLOAT SINGLE-FLOAT)
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     stipple pth/fvec p with lines of length s and gaps of length g
 ;   Source file: /data/x/auxin/src/draw/path.lisp
```

