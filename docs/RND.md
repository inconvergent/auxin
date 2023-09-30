#### RND:2IN-CIRC

```
 ; RND:2IN-CIRC
 ;   [symbol]
 ; 
 ; 2IN-CIRC names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %2IN-CIRC
 ;     ARGS: (&OPTIONAL (R 1.0))
 ;     DOCSTRING: random point in circle with rad r. centered at origin.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/2rnd.lisp
```

#### RND:2IN-RECT

```
 ; RND:2IN-RECT
 ;   [symbol]
 ; 
 ; 2IN-RECT names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %2IN-RECT
 ;     ARGS: ((VA 2 S))
 ;     DOCSTRING: random point in rectangle of size sx,sy. centered at origin.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/2rnd.lisp
```

#### RND:2IN-SQUARE

```
 ; RND:2IN-SQUARE
 ;   [symbol]
 ; 
 ; 2IN-SQUARE names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %2IN-SQUARE
 ;     ARGS: (&OPTIONAL (S 1.0))
 ;     DOCSTRING: random point in square of size s. centered at origin.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/2rnd.lisp
```

#### RND:2NDISTSAMPLE

```
 ; RND:2NDISTSAMPLE
 ;   [symbol]
 ; 
 ; 2NDISTSAMPLE names a compiled function:
 ;   Lambda-list: (WANT FX &KEY (RES (MAKE-ADJUSTABLE-VECTOR))
 ;                 (SAMPLE-NUM 50) (DSTFX (FUNCTION -F2DST2))
 ;                 (MIN-DST -1.0) (MAX-TRIES WANT))
 ;   Derived type: (FUNCTION
 ;                  (T FUNCTION &KEY (:RES ARRAY) (:SAMPLE-NUM FIXNUM)
 ;                   (:DSTFX FUNCTION) (:MIN-DST T) (:MAX-TRIES T))
 ;                  (VALUES VECTOR &OPTIONAL))
 ;   Documentation:
 ;     add want additional samples to res from batches of (f@fx sample-num),
 ;        always selecting the element furthest from existing elemets.
 ;          example: (rnd:max-distance-sample 100 (lambda (n) (rnd:nin-circ n 400f0)))
 ;   Source file: /data/x/auxin/src/rnd/2rnd.lisp
```

#### RND:2NIN-CIRC

```
 ; RND:2NIN-CIRC
 ;   [symbol]
 ; 
 ; 2NIN-CIRC names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %2NIN-CIRC
 ;     ARGS: (N &OPTIONAL (R 1.0))
 ;     DOCSTRING: n random points in circle with rad r. centered at origin.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/2rnd.lisp
```

#### RND:2NIN-RECT

```
 ; RND:2NIN-RECT
 ;   [symbol]
 ; 
 ; 2NIN-RECT names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %2NIN-RECT
 ;     ARGS: (N (VA 2 S))
 ;     DOCSTRING: n random points in rectangle of size sx,sy. centered at origin.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/2rnd.lisp
```

#### RND:2NIN-SQUARE

```
 ; RND:2NIN-SQUARE
 ;   [symbol]
 ; 
 ; 2NIN-SQUARE names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %2NIN-SQUARE
 ;     ARGS: (N &OPTIONAL (S 1.0))
 ;     DOCSTRING: n random points in square of size s. centered at origin.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/2rnd.lisp
```

#### RND:2NON-CIRC

```
 ; RND:2NON-CIRC
 ;   [symbol]
 ; 
 ; 2NON-CIRC names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %2NON-CIRC
 ;     ARGS: (N &OPTIONAL (R 1.0))
 ;     DOCSTRING: n random points on circle with rad r. centered at origin.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/2rnd.lisp
```

#### RND:2NON-LINE

```
 ; RND:2NON-LINE
 ;   [symbol]
 ; 
 ; 2NON-LINE names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %2NON-LINE
 ;     ARGS: (N (VA 2 A B))
 ;     DOCSTRING: n random points between a,b.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/2rnd.lisp
```

#### RND:2NON-LINE\*

```
:missing:todo:

 ; RND:2NON-LINE*
 ;   [symbol]
```

#### RND:2ON-CIRC

```
 ; RND:2ON-CIRC
 ;   [symbol]
 ; 
 ; 2ON-CIRC names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %2ON-CIRC
 ;     ARGS: (&OPTIONAL (R 1.0))
 ;     DOCSTRING: random point on circle with rad r. centered at origin.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/2rnd.lisp
```

#### RND:2ON-LINE

```
 ; RND:2ON-LINE
 ;   [symbol]
 ; 
 ; 2ON-LINE names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %2ON-LINE
 ;     ARGS: ((VA 2 A B))
 ;     DOCSTRING: random point between a,b.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/2rnd.lisp
```

#### RND:2ON-LINE\*

```
:missing:todo:

 ; RND:2ON-LINE*
 ;   [symbol]
```

#### RND:2WALKER

```
 ; RND:2WALKER
 ;   [symbol]
 ; 
 ; 2WALKER names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %2WALKER
 ;     ARGS: ((VA 2 X))
 ;     DOCSTRING: random 2d walker.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/walkers.lisp
```

#### RND:2WALKER-ACC

```
 ; RND:2WALKER-ACC
 ;   [symbol]
 ; 
 ; 2WALKER-ACC names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %2WALKER-ACC
 ;     ARGS: ((VA 2 X A))
 ;     DOCSTRING: accelerated random 2d walker.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/walkers.lisp
```

#### RND:3IN-BOX

```
 ; RND:3IN-BOX
 ;   [symbol]
 ; 
 ; 3IN-BOX names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %3IN-BOX
 ;     ARGS: ((VA 3 S))
 ;     DOCSTRING: random point in box of size sx,sy,sz. centered at origin.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/3rnd.lisp
```

#### RND:3IN-CUBE

```
 ; RND:3IN-CUBE
 ;   [symbol]
 ; 
 ; 3IN-CUBE names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %3IN-CUBE
 ;     ARGS: (&OPTIONAL (S 1.0))
 ;     DOCSTRING: random point in cube of size s. centered at origin.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/3rnd.lisp
```

#### RND:3IN-SPHERE

```
 ; RND:3IN-SPHERE
 ;   [symbol]
 ; 
 ; 3IN-SPHERE names a compiled function:
 ;   Lambda-list: (&OPTIONAL (R 1.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT)
 ;                  (VALUES SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT
 ;                          &OPTIONAL))
 ;   Documentation:
 ;     random point in sphere with rad r. centered at origin.
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/3rnd.lisp
```

#### RND:3NIN-BOX

```
 ; RND:3NIN-BOX
 ;   [symbol]
 ; 
 ; 3NIN-BOX names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %3NIN-BOX
 ;     ARGS: (N (VA 3 S))
 ;     DOCSTRING: n random points in box of size sx,sy,sz. centered at origin.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/3rnd.lisp
```

#### RND:3NIN-CUBE

```
 ; RND:3NIN-CUBE
 ;   [symbol]
 ; 
 ; 3NIN-CUBE names a compiled function:
 ;   Lambda-list: (N &OPTIONAL (S 1.0))
 ;   Derived type: (FUNCTION (T &OPTIONAL SINGLE-FLOAT)
 ;                  (VALUES (SIMPLE-ARRAY SINGLE-FLOAT (*)) &OPTIONAL))
 ;   Documentation:
 ;     n random points in cube of size sx. centered at origin.
 ;   Source file: /data/x/auxin/src/rnd/3rnd.lisp
```

#### RND:3NIN-SPHERE

```
 ; RND:3NIN-SPHERE
 ;   [symbol]
 ; 
 ; 3NIN-SPHERE names a compiled function:
 ;   Lambda-list: (N &OPTIONAL (R 1.0))
 ;   Derived type: (FUNCTION (T &OPTIONAL SINGLE-FLOAT)
 ;                  (VALUES (SIMPLE-ARRAY SINGLE-FLOAT (*)) &OPTIONAL))
 ;   Documentation:
 ;     n random points in sphere with rad r. centered at origin.
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/3rnd.lisp
```

#### RND:3NON-LINE

```
 ; RND:3NON-LINE
 ;   [symbol]
 ; 
 ; 3NON-LINE names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %3NON-LINE
 ;     ARGS: (N (VA 3 A B))
 ;     DOCSTRING: n random points between a,b.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/3rnd.lisp
```

#### RND:3NON-LINE\*

```
:missing:todo:

 ; RND:3NON-LINE*
 ;   [symbol]
```

#### RND:3NON-SPHERE

```
 ; RND:3NON-SPHERE
 ;   [symbol]
 ; 
 ; 3NON-SPHERE names a compiled function:
 ;   Lambda-list: (N &OPTIONAL (R 1.0))
 ;   Derived type: (FUNCTION (T &OPTIONAL SINGLE-FLOAT)
 ;                  (VALUES (SIMPLE-ARRAY SINGLE-FLOAT (*)) &OPTIONAL))
 ;   Documentation:
 ;     n random points on sphere with rad r. centered at origin.
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/3rnd.lisp
```

#### RND:3ON-LINE

```
 ; RND:3ON-LINE
 ;   [symbol]
 ; 
 ; 3ON-LINE names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %3ON-LINE
 ;     ARGS: ((VA 3 A B))
 ;     DOCSTRING: random point between a,b.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/3rnd.lisp
```

#### RND:3ON-LINE\*

```
:missing:todo:

 ; RND:3ON-LINE*
 ;   [symbol]
```

#### RND:3ON-SPHERE

```
 ; RND:3ON-SPHERE
 ;   [symbol]
 ; 
 ; 3ON-SPHERE names a compiled function:
 ;   Lambda-list: (&OPTIONAL (R 1.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT)
 ;                  (VALUES SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT
 ;                          &OPTIONAL))
 ;   Documentation:
 ;     random point on sphere with rad r. centered at origin.
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/3rnd.lisp
```

#### RND:3WALKER

```
 ; RND:3WALKER
 ;   [symbol]
 ; 
 ; 3WALKER names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %3WALKER
 ;     ARGS: ((VA 3 X))
 ;     DOCSTRING: random 3d walker.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/walkers.lisp
```

#### RND:3WALKER-ACC

```
 ; RND:3WALKER-ACC
 ;   [symbol]
 ; 
 ; 3WALKER-ACC names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %3WALKER-ACC
 ;     ARGS: ((VA 3 X A))
 ;     DOCSTRING: accelerated random 3d walker.
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/rnd/walkers.lisp
```

#### RND:ARRAY-SPLIT

```
:missing:todo:

 ; RND:ARRAY-SPLIT
 ;   [symbol]
```

#### RND:BERNOULLI

```
 ; RND:BERNOULLI
 ;   [symbol]
 ; 
 ; BERNOULLI names a compiled function:
 ;   Lambda-list: (N P)
 ;   Derived type: (FUNCTION ((UNSIGNED-BYTE 32) SINGLE-FLOAT)
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     n random numbers from bernoulli distribution with mean p.
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:EITHER

```
 ; RND:EITHER
 ;   [symbol]
 ; 
 ; EITHER names a macro:
 ;   Lambda-list: (A &OPTIONAL B)
 ;   Documentation:
 ;     excecutes either a or b, with a probablility of 0.5. b is optional.
 ;   Source file: /data/x/auxin/src/rnd/macros.lisp
```

#### RND:MAKE-RND-STATE

```
 ; RND:MAKE-RND-STATE
 ;   [symbol]
 ; 
 ; MAKE-RND-STATE names a compiled function:
 ;   Lambda-list: ()
 ;   Derived type: (FUNCTION NIL (VALUES RANDOM-STATE &OPTIONAL))
 ;   Documentation:
 ;     generate a new random state.
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:MAX-DISTANCE-SAMPLE

```
:missing:todo:

 ; RND:MAX-DISTANCE-SAMPLE
 ;   [symbol]
```

#### RND:NORM

```
 ; RND:NORM
 ;   [symbol]
 ; 
 ; NORM names a compiled function:
 ;   Lambda-list: (&KEY (MU 0.0) (SIGMA 1.0))
 ;   Derived type: (FUNCTION
 ;                  (&KEY (:MU SINGLE-FLOAT) (:SIGMA SINGLE-FLOAT))
 ;                  (VALUES SINGLE-FLOAT SINGLE-FLOAT &OPTIONAL))
 ;   Documentation:
 ;     two random numbers from normal distribution with (mu 0f0) and (sigma 1f0).
 ;     generated using the box-muller transform.
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:NRND

```
 ; RND:NRND
 ;   [symbol]
 ; 
 ; NRND names a compiled function:
 ;   Lambda-list: (N &OPTIONAL (X 1.0))
 ;   Derived type: (FUNCTION ((UNSIGNED-BYTE 32) &OPTIONAL SINGLE-FLOAT)
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     n random floates below x.
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:NRND\*

```
 ; RND:NRND*
 ;   [symbol]
 ; 
 ; NRND* names a compiled function:
 ;   Lambda-list: (N &OPTIONAL (X 1.0))
 ;   Derived type: (FUNCTION ((UNSIGNED-BYTE 32) &OPTIONAL SINGLE-FLOAT)
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     n random floats in range (x -x).
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:NRND-FROM

```
 ; RND:NRND-FROM
 ;   [symbol]
 ; 
 ; NRND-FROM names a compiled function:
 ;   Lambda-list: (N A)
 ;   Derived type: (FUNCTION ((UNSIGNED-BYTE 32) VECTOR)
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     n random elements from a.
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:NRND-FROM\*

```
 ; RND:NRND-FROM*
 ;   [symbol]
 ; 
 ; NRND-FROM* names a compiled function:
 ;   Lambda-list: (N A)
 ;   Derived type: (FUNCTION ((UNSIGNED-BYTE 32) VECTOR)
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     n random distinct elements from a. assumes no dupes in a.
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:NRNDI

```
 ; RND:NRNDI
 ;   [symbol]
 ; 
 ; NRNDI names a compiled function:
 ;   Lambda-list: (N A)
 ;   Derived type: (FUNCTION ((UNSIGNED-BYTE 32) (UNSIGNED-BYTE 32))
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     n random fixnums in range: (0 a].
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:NRNDRNG

```
 ; RND:NRNDRNG
 ;   [symbol]
 ; 
 ; NRNDRNG names a compiled function:
 ;   Lambda-list: (N A B)
 ;   Derived type: (FUNCTION
 ;                  ((UNSIGNED-BYTE 32) SINGLE-FLOAT SINGLE-FLOAT)
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     n random floats in range (a b).
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:NRNDRNGI

```
 ; RND:NRNDRNGI
 ;   [symbol]
 ; 
 ; NRNDRNGI names a compiled function:
 ;   Lambda-list: (N A B)
 ;   Derived type: (FUNCTION ((UNSIGNED-BYTE 32) FIXNUM FIXNUM)
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     n fixnums in range [a b).
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:PROB

```
 ; RND:PROB
 ;   [symbol]
 ; 
 ; PROB names a macro:
 ;   Lambda-list: (P A &OPTIONAL B)
 ;   Documentation:
 ;     evaluate first form in body with probability p.
 ;     second form (optional) is executed with probability 1-p.
 ;     ex: (prob 0.1 (print :a) (print :b)) ; returns :a or :b
 ;   Source file: /data/x/auxin/src/rnd/macros.lisp
```

#### RND:PROB\*

```
 ; RND:PROB*
 ;   [symbol]
 ; 
 ; PROB* names a macro:
 ;   Lambda-list: (P &BODY BODY)
 ;   Documentation:
 ;     evaluate body with probability p. returns the last form as if in a progn.
 ;     ex: (prob 0.1 (print :a) (print :b)) ; returns :b
 ;   Source file: /data/x/auxin/src/rnd/macros.lisp
```

#### RND:RCOND

```
 ; RND:RCOND
 ;   [symbol]
 ; 
 ; RCOND names a macro:
 ;   Lambda-list: (&REST CLAUSES)
 ;   Documentation:
 ;     executes the forms in clauses according to the probability of the weighted sum
 ;     ex: (rcond (0.1 (print :a)) (0.3 (print :b)) ...)
 ;     will print :a 1 times out of 4.
 ;   Source file: /data/x/auxin/src/rnd/macros.lisp
```

#### RND:REP

```
 ; RND:REP
 ;   [symbol]
 ; 
 ; REP names a macro:
 ;   Lambda-list: (A &OPTIONAL B &BODY BODY)
 ;   Documentation:
 ;     repeat body at most a times, or between a and b times.
 ;   Source file: /data/x/auxin/src/rnd/macros.lisp
```

#### RND:RND

```
 ; RND:RND
 ;   [symbol]
 ; 
 ; RND names a compiled function:
 ;   Lambda-list: (&OPTIONAL (X 1.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT)
 ;                  (VALUES (SINGLE-FLOAT 0.0) &OPTIONAL))
 ;   Documentation:
 ;     random float below x.
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:RND\*

```
 ; RND:RND*
 ;   [symbol]
 ; 
 ; RND* names a compiled function:
 ;   Lambda-list: (&OPTIONAL (X 1.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT)
 ;                  (VALUES SINGLE-FLOAT &OPTIONAL))
 ;   Documentation:
 ;     random float in range (-x x).
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:RNDGET

```
 ; RND:RNDGET
 ;   [symbol]
 ; 
 ; RNDGET names a compiled function:
 ;   Lambda-list: (L)
 ;   Derived type: (FUNCTION (SEQUENCE) (VALUES T &OPTIONAL))
 ;   Documentation:
 ;     get random item from sequence l.
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:RNDI

```
 ; RND:RNDI
 ;   [symbol]
 ; 
 ; RNDI names a compiled function:
 ;   Lambda-list: (A)
 ;   Derived type: (FUNCTION (FIXNUM)
 ;                  (VALUES (MOD 4611686018427387903) &OPTIONAL))
 ;   Documentation:
 ;     random fixnum in range (0 a].
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:RNDRNG

```
 ; RND:RNDRNG
 ;   [symbol]
 ; 
 ; RNDRNG names a compiled function:
 ;   Lambda-list: (A B)
 ;   Derived type: (FUNCTION (SINGLE-FLOAT SINGLE-FLOAT)
 ;                  (VALUES SINGLE-FLOAT &OPTIONAL))
 ;   Documentation:
 ;     random float in range (a b).
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:RNDRNGI

```
 ; RND:RNDRNGI
 ;   [symbol]
 ; 
 ; RNDRNGI names a compiled function:
 ;   Lambda-list: (A B)
 ;   Derived type: (FUNCTION (FIXNUM FIXNUM)
 ;                  (VALUES
 ;                   (INTEGER -4611686018427387904 9223372036854775805)
 ;                   &OPTIONAL))
 ;   Documentation:
 ;     random fixnum in range (a b].
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:RNDSPACE

```
 ; RND:RNDSPACE
 ;   [symbol]
 ; 
 ; RNDSPACE names a compiled function:
 ;   Lambda-list: (N A B &KEY ORDER &AUX (D (- B A)))
 ;   Derived type: (FUNCTION
 ;                  ((UNSIGNED-BYTE 32) SINGLE-FLOAT SINGLE-FLOAT &KEY
 ;                   (:ORDER T))
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     n random numbers in range (a b). use :order t to sort result.
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:RNDSPACEI

```
 ; RND:RNDSPACEI
 ;   [symbol]
 ; 
 ; RNDSPACEI names a compiled function:
 ;   Lambda-list: (N A B &KEY ORDER &AUX (D (- B A)))
 ;   Derived type: (FUNCTION
 ;                  ((UNSIGNED-BYTE 32) FIXNUM FIXNUM &KEY (:ORDER T))
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     n random fixnums in range [a b). use order to sort result.
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:SET-RND-STATE

```
 ; RND:SET-RND-STATE
 ;   [symbol]
 ; 
 ; SET-RND-STATE names a compiled function:
 ;   Lambda-list: (&OPTIONAL I)
 ;   Derived type: (FUNCTION (&OPTIONAL T) *)
 ;   Documentation:
 ;     use this random seed. only implemented for SBCL.
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:SHUFFLE

```
 ; RND:SHUFFLE
 ;   [symbol]
 ; 
 ; SHUFFLE names a compiled function:
 ;   Lambda-list: (A* &AUX (N (LENGTH A*)))
 ;   Derived type: (FUNCTION (SIMPLE-ARRAY)
 ;                  (VALUES (SIMPLE-ARRAY * (*)) &OPTIONAL))
 ;   Documentation:
 ;     shuffle a with fisher yates algorithm.
 ;   Source file: /data/x/auxin/src/rnd/rnd.lisp
```

#### RND:WALKER

```
 ; RND:WALKER
 ;   [symbol]
 ; 
 ; WALKER names a compiled function:
 ;   Lambda-list: (&OPTIONAL (X 0.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT)
 ;                  (VALUES FUNCTION &OPTIONAL))
 ;   Documentation:
 ;     random walker.
 ;   Source file: /data/x/auxin/src/rnd/walkers.lisp
```

#### RND:WALKER-ACC

```
 ; RND:WALKER-ACC
 ;   [symbol]
 ; 
 ; WALKER-ACC names a compiled function:
 ;   Lambda-list: (&OPTIONAL (X 0.0) (A 0.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT SINGLE-FLOAT)
 ;                  (VALUES FUNCTION &OPTIONAL))
 ;   Documentation:
 ;     accelerated random walker.
 ;   Source file: /data/x/auxin/src/rnd/walkers.lisp
```

