## `ADD`
```
 ; MATH:ADD
 ;   [symbol]
 ; 
 ; ADD names a compiled function:
 ;   Lambda-list: (AA BB)
 ;   Derived type: (FUNCTION (LIST LIST) (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     element wise + for two lists of FIXNUM
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `ARGMAX`
```
 ; MATH:ARGMAX
 ;   [symbol]
 ; 
 ; ARGMAX names a compiled function:
 ;   Lambda-list: (LL &OPTIONAL (KEY (FUNCTION IDENTITY)))
 ;   Derived type: (FUNCTION (LIST &OPTIONAL FUNCTION)
 ;                  (VALUES UNSIGNED-BYTE T &OPTIONAL))
 ;   Documentation:
 ;     returns (values index val) for the largest val in ll
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `ARGMIN`
```
 ; MATH:ARGMIN
 ;   [symbol]
 ; 
 ; ARGMIN names a compiled function:
 ;   Lambda-list: (LL &OPTIONAL (KEY (FUNCTION IDENTITY)))
 ;   Derived type: (FUNCTION (LIST &OPTIONAL FUNCTION)
 ;                  (VALUES UNSIGNED-BYTE T &OPTIONAL))
 ;   Documentation:
 ;     returns (values index val) for the smallest val in ll.
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `CLOSE-PATH`
```
 ; MATH:CLOSE-PATH
 ;   [symbol]
 ; 
 ; CLOSE-PATH names a compiled function:
 ;   Lambda-list: (P)
 ;   Derived type: (FUNCTION (LIST) (VALUES CONS &OPTIONAL))
 ;   Documentation:
 ;     append first element of p to end of p.
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `CLOSE-PATH*`
```
 ; MATH:CLOSE-PATH*
 ;   [symbol]
 ; 
 ; CLOSE-PATH* names a compiled function:
 ;   Lambda-list: (P)
 ;   Derived type: (FUNCTION (LIST) (VALUES CONS &OPTIONAL))
 ;   Documentation:
 ;     append last element of p to front of p.
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `COPY-SORT`
```
 ; MATH:COPY-SORT
 ;   [symbol]
 ; 
 ; COPY-SORT names a compiled function:
 ;   Lambda-list: (A FX &KEY (KEY (FUNCTION IDENTITY)))
 ;   Derived type: (FUNCTION (SEQUENCE T &KEY (:KEY T))
 ;                  (VALUES SEQUENCE &OPTIONAL))
 ;   Documentation:
 ;     sort a without side effects to a. not very efficent.
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `IMOD`
```
 ; MATH:IMOD
 ;   [symbol]
 ; 
 ; IMOD names a compiled function:
 ;   Lambda-list: (I INC M)
 ;   Derived type: (FUNCTION (FIXNUM FIXNUM FIXNUM)
 ;                  (VALUES
 ;                   (INTEGER -4611686018427387903 4611686018427387903)
 ;                   &OPTIONAL))
 ;   Documentation:
 ;     (mod (+ i inc) m) for fixnums
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `INTEGER-SEARCH`
```
 ; MATH:INTEGER-SEARCH
 ;   [symbol]
 ; 
 ; INTEGER-SEARCH names a compiled function:
 ;   Lambda-list: (AA V &AUX (N (LENGTH AA)))
 ;   Derived type: (FUNCTION (VECTOR FIXNUM)
 ;                  (VALUES (OR (MOD 17592186044415) NULL) &OPTIONAL))
 ;   Documentation:
 ;     binary integer search. assumes presorted list of integers
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `LAST*`
```
:missing:

 ; MATH:LAST*
 ;   [symbol]
 ; 
 ; LAST* names a compiled function:
 ;   Lambda-list: (L)
 ;   Derived type: (FUNCTION (LIST) (VALUES T &OPTIONAL))
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `LERP`
```
:missing:

 ; MATH:LERP
 ;   [symbol]
```

## `LGET`
```
:missing:

 ; MATH:LGET
 ;   [symbol]
```

## `LINSPACE`
```
 ; MATH:LINSPACE
 ;   [symbol]
 ; 
 ; LINSPACE names a compiled function:
 ;   Lambda-list: (N A B &KEY (END T))
 ;   Derived type: (FUNCTION
 ;                  ((UNSIGNED-BYTE 32) SINGLE-FLOAT SINGLE-FLOAT &KEY
 ;                   (:END BOOLEAN))
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     n veq:ffs from a to b.
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `LIST>THAN`
```
 ; MATH:LIST>THAN
 ;   [symbol]
 ; 
 ; LIST>THAN names a compiled function:
 ;   Lambda-list: (L N)
 ;   Derived type: (FUNCTION (LIST (UNSIGNED-BYTE 32))
 ;                  (VALUES BOOLEAN &OPTIONAL))
 ;   Documentation:
 ;     list is longer than n?
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `LL-TRANSPOSE`
```
 ; MATH:LL-TRANSPOSE
 ;   [symbol]
 ; 
 ; LL-TRANSPOSE names a compiled function:
 ;   Lambda-list: (L)
 ;   Derived type: (FUNCTION (LIST) (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     transpose list of lists.
 ;     assumes all initial lists in l have the same length.
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `LPOS`
```
 ; MATH:LPOS
 ;   [symbol]
 ; 
 ; LPOS names a compiled function:
 ;   Lambda-list: (LL &KEY (FX (FUNCTION FIRST)))
 ;   Derived type: (FUNCTION (LIST &KEY (:FX FUNCTION))
 ;                  (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     apply fx to every element in ll.
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `MOD2`
```
 ; MATH:MOD2
 ;   [symbol]
 ; 
 ; MOD2 names a compiled function:
 ;   Lambda-list: (I)
 ;   Derived type: (FUNCTION (FIXNUM) (VALUES BIT &OPTIONAL))
 ;   Documentation:
 ;     (mod i 2) for fixnums.
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `MULT`
```
 ; MATH:MULT
 ;   [symbol]
 ; 
 ; MULT names a compiled function:
 ;   Lambda-list: (AA BB)
 ;   Derived type: (FUNCTION (LIST LIST) (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     element wise * for two lists of FIXNUM
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `NREP`
```
 ; MATH:NREP
 ;   [symbol]
 ; 
 ; NREP names a macro:
 ;   Lambda-list: (N &BODY BODY)
 ;   Documentation:
 ;     returns list with body :evaluated: n times.
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `RANGE`
```
 ; MATH:RANGE
 ;   [symbol]
 ; 
 ; RANGE names a compiled function:
 ;   Lambda-list: (A &OPTIONAL (B NIL))
 ;   Derived type: (FUNCTION (FIXNUM &OPTIONAL T) (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     fixnums from 0 to a, or a to b.
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `RANGE-SEARCH`
```
 ; MATH:RANGE-SEARCH
 ;   [symbol]
 ; 
 ; RANGE-SEARCH names a compiled function:
 ;   Lambda-list: (RANGES F &AUX (N (1- (LENGTH RANGES)))
 ;                 (RANGES* (ENSURE-VECTOR RANGES)))
 ;   Derived type: (FUNCTION (T T) (VALUES (MOD 17592186044415) &OPTIONAL))
 ;   Documentation:
 ;     binary range search.  range must be sorted in ascending order. f is a value
 ;     inside the range you are looking for.
 ;   Source file: /data/x/auxin/src/math.lisp
```

## `SUB`
```
 ; MATH:SUB
 ;   [symbol]
 ; 
 ; SUB names a compiled function:
 ;   Lambda-list: (AA BB)
 ;   Derived type: (FUNCTION (LIST LIST) (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     element wise - for two lists of FIXNUM
 ;   Source file: /data/x/auxin/src/math.lisp
```

