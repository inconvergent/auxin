#### SIMPLIFY:PATH

```
 ; SIMPLIFY:PATH
 ;   [symbol]
 ; 
 ; PATH names a compiled function:
 ;   Lambda-list: (PTS &KEY (LIM 1.0) &AUX
 ;                 (INDS
 ;                  (-SIMPLIFY PTS LIM LEFT 0 RIGHT
 ;                             (1- (ROUND (LENGTH PTS) 2)))))
 ;   Derived type: (FUNCTION
 ;                  ((SIMPLE-ARRAY SINGLE-FLOAT) &KEY (:LIM SINGLE-FLOAT))
 ;                  (VALUES T (VECTOR (UNSIGNED-BYTE 31)) &OPTIONAL))
 ;   Documentation:
 ;     simplify path, pts. lim is the distance of candidate pt to candidate line
 ;     returns new path
 ;   Source file: /data/x/auxin/src/draw/simplify-path.lisp
```

