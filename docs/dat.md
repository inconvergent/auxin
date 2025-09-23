## `DO-LINES-AS-BUFFER`
```
 ; DAT:DO-LINES-AS-BUFFER
 ;   [symbol]
 ; 
 ; DO-LINES-AS-BUFFER names a compiled function:
 ;   Lambda-list: (FN FX &KEY (BUFFER-WIDTH 80))
 ;   Derived type: (FUNCTION (T FUNCTION &KEY (:BUFFER-WIDTH FIXNUM))
 ;                  (VALUES NULL &OPTIONAL))
 ;   Documentation:
 ;     fx will receive a stream (named in). use it like this:
 ;         (loop for x = (read in nil nil)
 ;               while x do something)
 ;   Source file: /home/anders/x/auxin/src/dat.lisp
```

## `EXPORT-DATA`
```
:missing:

 ; DAT:EXPORT-DATA
 ;   [symbol]
 ; 
 ; EXPORT-DATA names a compiled function:
 ;   Lambda-list: (O FN &OPTIONAL (POSTFIX .dat) PRETTY)
 ;   Derived type: (FUNCTION (T T &OPTIONAL T T) (VALUES T &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/dat.lisp
```

## `IMPORT-ALL-DATA`
```
:missing:

 ; DAT:IMPORT-ALL-DATA
 ;   [symbol]
 ; 
 ; IMPORT-ALL-DATA names a compiled function:
 ;   Lambda-list: (FN &OPTIONAL (POSTFIX .dat))
 ;   Derived type: (FUNCTION (T &OPTIONAL T) (VALUES LIST &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/dat.lisp
```

## `IMPORT-DATA`
```
:missing:

 ; DAT:IMPORT-DATA
 ;   [symbol]
 ; 
 ; IMPORT-DATA names a compiled function:
 ;   Lambda-list: (FN &OPTIONAL (POSTFIX .dat))
 ;   Derived type: (FUNCTION (T &OPTIONAL T) (VALUES T &OPTIONAL))
 ;   Source file: /home/anders/x/auxin/src/dat.lisp
```

