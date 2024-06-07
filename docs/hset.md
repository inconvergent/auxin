## `ADD`
```
 ; HSET:ADD
 ;   [symbol]
 ; 
 ; ADD names a compiled function:
 ;   Lambda-list: (S E)
 ;   Derived type: (FUNCTION (HASH-TABLE FIXNUM)
 ;                  (VALUES BOOLEAN &OPTIONAL))
 ;   Documentation:
 ;     add e to fixnum set.
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/hset.lisp
```

## `ADD*`
```
 ; HSET:ADD*
 ;   [symbol]
 ; 
 ; ADD* names a compiled function:
 ;   Lambda-list: (S EE)
 ;   Derived type: (FUNCTION (HASH-TABLE SEQUENCE) (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     add sequence of fixnums to fixnum set.
 ;   Source file: /data/x/auxin/src/hset.lisp
```

## `COPY`
```
 ; HSET:COPY
 ;   [symbol]
 ; 
 ; COPY names a compiled function:
 ;   Lambda-list: (S &KEY (SIZE 100) (INC 2.0))
 ;   Derived type: (FUNCTION
 ;                  (HASH-TABLE &KEY (:SIZE FIXNUM) (:INC NUMBER))
 ;                  (VALUES HASH-TABLE &OPTIONAL))
 ;   Documentation:
 ;     copy fixnum set.
 ;   Source file: /data/x/auxin/src/hset.lisp
```

## `DEL`
```
 ; HSET:DEL
 ;   [symbol]
 ; 
 ; DEL names a compiled function:
 ;   Lambda-list: (S E)
 ;   Derived type: (FUNCTION (HASH-TABLE FIXNUM)
 ;                  (VALUES BOOLEAN &OPTIONAL))
 ;   Documentation:
 ;     del e from fixnum set.
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/hset.lisp
```

## `DEL*`
```
 ; HSET:DEL*
 ;   [symbol]
 ; 
 ; DEL* names a compiled function:
 ;   Lambda-list: (S EE)
 ;   Derived type: (FUNCTION (HASH-TABLE SEQUENCE) (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     del sequence of fixnum from fixnum set.
 ;   Source file: /data/x/auxin/src/hset.lisp
```

## `INTER`
```
 ; HSET:INTER
 ;   [symbol]
 ; 
 ; INTER names a compiled function:
 ;   Lambda-list: (A B)
 ;   Derived type: (FUNCTION (HASH-TABLE HASH-TABLE)
 ;                  (VALUES HASH-TABLE &OPTIONAL))
 ;   Documentation:
 ;     return new fixnum set which contains the intersection of a,b.
 ;   Source file: /data/x/auxin/src/hset.lisp
```

## `MAKE`
```
 ; HSET:MAKE
 ;   [symbol]
 ; 
 ; MAKE names a compiled function:
 ;   Lambda-list: (&KEY INIT (SIZE 100) (INC 2.0))
 ;   Derived type: (FUNCTION (&KEY (:INIT T) (:SIZE FIXNUM) (:INC T))
 ;                  (VALUES HASH-TABLE &OPTIONAL))
 ;   Documentation:
 ;     create fixnum set. init (optional) is a list of integers.
 ;   Source file: /data/x/auxin/src/hset.lisp
```

## `MEM`
```
 ; HSET:MEM
 ;   [symbol]
 ; 
 ; MEM names a compiled function:
 ;   Lambda-list: (S E)
 ;   Derived type: (FUNCTION (HASH-TABLE FIXNUM)
 ;                  (VALUES BOOLEAN &OPTIONAL))
 ;   Documentation:
 ;     t if e is member of fixnum set s.
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/hset.lisp
```

## `MEM*`
```
 ; HSET:MEM*
 ;   [symbol]
 ; 
 ; MEM* names a compiled function:
 ;   Lambda-list: (S EE)
 ;   Derived type: (FUNCTION (HASH-TABLE SEQUENCE) (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     returns list with a boolean for each fixnum in sequence ee.
 ;   Source file: /data/x/auxin/src/hset.lisp
```

## `NUM`
```
 ; HSET:NUM
 ;   [symbol]
 ; 
 ; NUM names a compiled function:
 ;   Lambda-list: (S)
 ;   Derived type: (FUNCTION (HASH-TABLE)
 ;                  (VALUES (UNSIGNED-BYTE 44) &OPTIONAL))
 ;   Documentation:
 ;     count elements in fixnum set.
 ;   Source file: /data/x/auxin/src/hset.lisp
```

## `SYMDIFF`
```
 ; HSET:SYMDIFF
 ;   [symbol]
 ; 
 ; SYMDIFF names a compiled function:
 ;   Lambda-list: (A B)
 ;   Derived type: (FUNCTION (HASH-TABLE HASH-TABLE)
 ;                  (VALUES HASH-TABLE &OPTIONAL))
 ;   Documentation:
 ;     return new fixnum set which contains the symmetric difference of a,b.
 ;   Source file: /data/x/auxin/src/hset.lisp
```

## `TO-LIST`
```
 ; HSET:TO-LIST
 ;   [symbol]
 ; 
 ; TO-LIST names a compiled function:
 ;   Lambda-list: (S)
 ;   Derived type: (FUNCTION (HASH-TABLE) (VALUES LIST &OPTIONAL))
 ;   Documentation:
 ;     get unordered list of elements in fixnum set.
 ;   Source file: /data/x/auxin/src/hset.lisp
```

## `UNI`
```
 ; HSET:UNI
 ;   [symbol]
 ; 
 ; UNI names a compiled function:
 ;   Lambda-list: (A B)
 ;   Derived type: (FUNCTION (HASH-TABLE HASH-TABLE)
 ;                  (VALUES HASH-TABLE &OPTIONAL))
 ;   Documentation:
 ;     return new fixnum set which contains the union of a,b.
 ;   Source file: /data/x/auxin/src/hset.lisp
```

