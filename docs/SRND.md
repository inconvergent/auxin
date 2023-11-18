#### SRND:2IN-CIRC

```
 ; SRND:2IN-CIRC
 ;   [symbol]
 ; 
 ; 2IN-CIRC names a compiled function:
 ;   Lambda-list: (RS R)
 ;   Derived type: (FUNCTION (SRND:SRND SINGLE-FLOAT)
 ;                  (VALUES SINGLE-FLOAT SINGLE-FLOAT &OPTIONAL))
 ;   Documentation:
 ;     random point in circle with rad r from state rs. centered at origin.
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
```

#### SRND:2IN-CIRC+

```
:missing:todo:

 ; SRND:2IN-CIRC+
 ;   [symbol]
 ; 
 ; 2IN-CIRC+ names a macro:
 ;   Lambda-list: (RS S &REST REST)
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
```

#### SRND:2ON-CIRC

```
 ; SRND:2ON-CIRC
 ;   [symbol]
 ; 
 ; 2ON-CIRC names a compiled function:
 ;   Lambda-list: (RS R)
 ;   Derived type: (FUNCTION (SRND:SRND SINGLE-FLOAT)
 ;                  (VALUES SINGLE-FLOAT SINGLE-FLOAT &OPTIONAL))
 ;   Documentation:
 ;     get random point on circle with rad r from state rs. centered at origin.
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
```

#### SRND:2ON-CIRC+

```
:missing:todo:

 ; SRND:2ON-CIRC+
 ;   [symbol]
 ; 
 ; 2ON-CIRC+ names a macro:
 ;   Lambda-list: (RS S &REST REST)
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
```

#### SRND:3IN-SPHERE

```
 ; SRND:3IN-SPHERE
 ;   [symbol]
 ; 
 ; 3IN-SPHERE names a compiled function:
 ;   Lambda-list: (RS R)
 ;   Derived type: (FUNCTION (SRND:SRND SINGLE-FLOAT)
 ;                  (VALUES SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT
 ;                          &OPTIONAL))
 ;   Documentation:
 ;     get random point in sphere with rad r from state rs. centered at origin.
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
```

#### SRND:3IN-SPHERE+

```
:missing:todo:

 ; SRND:3IN-SPHERE+
 ;   [symbol]
 ; 
 ; 3IN-SPHERE+ names a macro:
 ;   Lambda-list: (RS S &REST REST)
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
```

#### SRND:3ON-SPHERE

```
 ; SRND:3ON-SPHERE
 ;   [symbol]
 ; 
 ; 3ON-SPHERE names a compiled function:
 ;   Lambda-list: (RS R)
 ;   Derived type: (FUNCTION (SRND:SRND SINGLE-FLOAT)
 ;                  (VALUES SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT
 ;                          &OPTIONAL))
 ;   Documentation:
 ;     get random point on sphere with rad r from state rs. centered at origin.
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
```

#### SRND:3ON-SPHERE+

```
:missing:todo:

 ; SRND:3ON-SPHERE+
 ;   [symbol]
 ; 
 ; 3ON-SPHERE+ names a macro:
 ;   Lambda-list: (RS S &REST REST)
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
```

#### SRND:MAKE

```
 ; SRND:MAKE
 ;   [symbol]
 ; 
 ; MAKE names a compiled function:
 ;   Lambda-list: (RS)
 ;   Derived type: (FUNCTION (FIXNUM) (VALUES SRND:SRND &OPTIONAL))
 ;   Documentation:
 ;     make stateful rnd generator
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
```

#### SRND:PROB

```
 ; SRND:PROB
 ;   [symbol]
 ; 
 ; PROB names a macro:
 ;   Lambda-list: (RS P A &OPTIONAL B)
 ;   Documentation:
 ;     evaluate first form in body with probability p. second form (optional) is
 ;     executed with probability 1-p. ex: (prob 0.1 (print :a) (print :b))
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
```

#### SRND:RCOND

```
 ; SRND:RCOND
 ;   [symbol]
 ; 
 ; RCOND names a macro:
 ;   Lambda-list: (RS &REST CLAUSES)
 ;   Documentation:
 ;     executes the forms in clauses according to the probability of the weighted sum
 ;     ex: (rcond (0.1 (print :a)) (0.3 (print :b)) ...)
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
```

#### SRND:RND

```
 ; SRND:RND
 ;   [symbol]
 ; 
 ; RND names a macro:
 ;   Lambda-list: (RS &OPTIONAL R)
 ;   Documentation:
 ;     get a random float [0.0 1.0] from state rs (scaled by r)
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
```

#### SRND:RND\*

```
 ; SRND:RND*
 ;   [symbol]
 ; 
 ; RND* names a macro:
 ;   Lambda-list: (RS &OPTIONAL R)
 ;   Documentation:
 ;     get a random float in range [-r r] from state rs. r defaults to 1.0
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
```

#### SRND:RNDRNG

```
 ; SRND:RNDRNG
 ;   [symbol]
 ; 
 ; RNDRNG names a macro:
 ;   Lambda-list: (RS A B)
 ;   Documentation:
 ;     get a random number in range [a b] from state rs
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
```

#### SRND:SRND

```
 ; SRND:SRND
 ;   [symbol]
 ; 
 ; SRND names a compiled function:
 ;   Lambda-list: (RS)
 ;   Derived type: (FUNCTION (T) (VALUES SRND:SRND &OPTIONAL))
 ;   Documentation:
 ;     see make
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/rnd/srnd.lisp
 ; 
 ; SRND names the structure-class #<STRUCTURE-CLASS SRND:SRND>:
 ;   Class precedence-list: SRND:SRND, STRUCTURE-OBJECT,
 ;                          SB-PCL::SLOT-OBJECT, T
 ;   Direct superclasses: STRUCTURE-OBJECT
 ;   No subclasses.
 ;   Slots:
 ;     SRND::S
 ;       Type: VEQ:PN
 ;       Initform: 0
```

