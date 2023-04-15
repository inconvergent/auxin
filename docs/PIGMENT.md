#### PIGMENT:AS-HEX

```
(values #rrggbb a)

 ; PIGMENT:AS-HEX
 ;   [symbol]
 ; 
 ; AS-HEX names a compiled function:
 ;   Lambda-list: (C)
 ;   Derived type: (FUNCTION (PIGMENT::RGBA)
 ;                  (VALUES SIMPLE-STRING SINGLE-FLOAT &OPTIONAL))
 ;   Documentation:
 ;     (values #rrggbb a)
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:AS-HSV

```
return pigment as (list h s v a)

 ; PIGMENT:AS-HSV
 ;   [symbol]
 ; 
 ; AS-HSV names a compiled function:
 ;   Lambda-list: (C)
 ;   Derived type: (FUNCTION (PIGMENT::RGBA) (VALUES CONS &OPTIONAL))
 ;   Documentation:
 ;     return pigment as (list h s v a)
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:AS-LIST

```
return list with (r g b a), (r g b) is pre multiplied

 ; PIGMENT:AS-LIST
 ;   [symbol]
 ; 
 ; AS-LIST names a compiled function:
 ;   Lambda-list: (C)
 ;   Derived type: (FUNCTION (PIGMENT::RGBA) (VALUES CONS &OPTIONAL))
 ;   Documentation:
 ;     return list with (r g b a), (r g b) is pre multiplied
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:AS-LIST\*

```
return (r g b a)

 ; PIGMENT:AS-LIST*
 ;   [symbol]
 ; 
 ; AS-LIST* names a compiled function:
 ;   Lambda-list: (C)
 ;   Derived type: (FUNCTION (PIGMENT::RGBA) (VALUES CONS &OPTIONAL))
 ;   Documentation:
 ;     return (r g b a)
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:AS-VAL

```
as values, pre-multiplied

 ; PIGMENT:AS-VAL
 ;   [symbol]
 ; 
 ; AS-VAL names a compiled function:
 ;   Lambda-list: (C)
 ;   Derived type: (FUNCTION (PIGMENT::RGBA)
 ;                  (VALUES SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT
 ;                          SINGLE-FLOAT &OPTIONAL))
 ;   Documentation:
 ;     as values, pre-multiplied
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:AS-VAL\*

```
as values

 ; PIGMENT:AS-VAL*
 ;   [symbol]
 ; 
 ; AS-VAL* names a compiled function:
 ;   Lambda-list: (C)
 ;   Derived type: (FUNCTION (PIGMENT::RGBA)
 ;                  (VALUES SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT
 ;                          SINGLE-FLOAT &OPTIONAL))
 ;   Documentation:
 ;     as values
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:BLACK

```
black

 ; PIGMENT:BLACK
 ;   [symbol]
 ; 
 ; BLACK names a compiled function:
 ;   Lambda-list: (&OPTIONAL (A 1.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT) *)
 ;   Documentation:
 ;     black
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:BLUE

```
blue

 ; PIGMENT:BLUE
 ;   [symbol]
 ; 
 ; BLUE names a compiled function:
 ;   Lambda-list: (&OPTIONAL (A 1.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT) *)
 ;   Documentation:
 ;     blue
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:CMYK

```
create pigment from (c m y k a). a is optional.

 ; PIGMENT:CMYK
 ;   [symbol]
 ; 
 ; CMYK names a compiled function:
 ;   Lambda-list: (CMY/X-0 CMY/Y-1 CMY/Z-2 K &OPTIONAL (A 1.0))
 ;   Derived type: (FUNCTION
 ;                  (SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT
 ;                   &OPTIONAL SINGLE-FLOAT)
 ;                  *)
 ;   Documentation:
 ;     create pigment from (c m y k a). a is optional.
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:COPY

```
copy a pigment

 ; PIGMENT:COPY
 ;   [symbol]
 ; 
 ; COPY names a compiled function:
 ;   Lambda-list: (C)
 ;   Derived type: (FUNCTION (PIGMENT::RGBA)
 ;                  (VALUES PIGMENT::RGBA &OPTIONAL))
 ;   Documentation:
 ;     copy a pigment
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:CYAN

```
cyan with s, v, a

 ; PIGMENT:CYAN
 ;   [symbol]
 ; 
 ; CYAN names a compiled function:
 ;   Lambda-list: (&KEY (SAT 1.0) (VAL 1.0) (ALPHA 1.0))
 ;   Derived type: (FUNCTION (&KEY (:SAT T) (:VAL T) (:ALPHA T)) *)
 ;   Documentation:
 ;     cyan with s, v, a
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:DARK

```
0.2 gray

 ; PIGMENT:DARK
 ;   [symbol]
 ; 
 ; DARK names a compiled function:
 ;   Lambda-list: (&OPTIONAL (A 1.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT) *)
 ;   Documentation:
 ;     0.2 gray
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:GRAY

```
v gray

 ; PIGMENT:GRAY
 ;   [symbol]
 ; 
 ; GRAY names a compiled function:
 ;   Lambda-list: (&OPTIONAL (V 0.5) (A 1.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT SINGLE-FLOAT) *)
 ;   Documentation:
 ;     v gray
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:GREEN

```
green

 ; PIGMENT:GREEN
 ;   [symbol]
 ; 
 ; GREEN names a compiled function:
 ;   Lambda-list: (&OPTIONAL (A 1.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT) *)
 ;   Documentation:
 ;     green
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:HSV

```
create pigment from (h s v a). a is optional.

 ; PIGMENT:HSV
 ;   [symbol]
 ; 
 ; HSV names a compiled function:
 ;   Lambda-list: (H S V &OPTIONAL (A 1.0))
 ;   Derived type: (FUNCTION
 ;                  (SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT &OPTIONAL
 ;                   SINGLE-FLOAT)
 ;                  *)
 ;   Documentation:
 ;     create pigment from (h s v a). a is optional.
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:MAGENTA

```
magenta with s, v, a

 ; PIGMENT:MAGENTA
 ;   [symbol]
 ; 
 ; MAGENTA names a compiled function:
 ;   Lambda-list: (&KEY (SAT 1.0) (VAL 1.0) (ALPHA 1.0))
 ;   Derived type: (FUNCTION (&KEY (:SAT T) (:VAL T) (:ALPHA T)) *)
 ;   Documentation:
 ;     magenta with s, v, a
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:MAKE

```
make a pigment instance (r g b a). all values should range be [0 1].
stored internally with pre-multiplied alpha.

 ; PIGMENT:MAKE
 ;   [symbol]
 ; 
 ; MAKE names a compiled function:
 ;   Lambda-list: (R G B &OPTIONAL (A 1.0))
 ;   Derived type: (FUNCTION
 ;                  (SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT &OPTIONAL
 ;                   SINGLE-FLOAT)
 ;                  (VALUES PIGMENT::RGBA &OPTIONAL))
 ;   Documentation:
 ;     make a pigment instance (r g b a). all values should range be [0 1].
 ;     stored internally with pre-multiplied alpha.
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:MDARK

```
0.3 gray

 ; PIGMENT:MDARK
 ;   [symbol]
 ; 
 ; MDARK names a compiled function:
 ;   Lambda-list: (&OPTIONAL (A 1.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT) *)
 ;   Documentation:
 ;     0.3 gray
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:RED

```
red

 ; PIGMENT:RED
 ;   [symbol]
 ; 
 ; RED names a compiled function:
 ;   Lambda-list: (&OPTIONAL (A 1.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT) *)
 ;   Documentation:
 ;     red
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:RGB

```
same as make.

 ; PIGMENT:RGB
 ;   [symbol]
 ; 
 ; RGB names a compiled function:
 ;   Lambda-list: (RGB/X-0 RGB/Y-1 RGB/Z-2 &OPTIONAL (A 1.0))
 ;   Derived type: (FUNCTION
 ;                  (SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT &OPTIONAL
 ;                   SINGLE-FLOAT)
 ;                  *)
 ;   Documentation:
 ;     same as make.
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:SCALE

```
scale by s. scales with alpha value.
note: this trival scale of pre-multiplied values.

 ; PIGMENT:SCALE
 ;   [symbol]
 ; 
 ; SCALE names a compiled function:
 ;   Lambda-list: (C S)
 ;   Derived type: (FUNCTION (PIGMENT::RGBA SINGLE-FLOAT)
 ;                  (VALUES PIGMENT::RGBA &OPTIONAL))
 ;   Documentation:
 ;     scale by s. scales with alpha value.
 ;     note: this trival scale of pre-multiplied values.
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:SCALE!

```
scale by s in place.

 ; PIGMENT:SCALE!
 ;   [symbol]
 ; 
 ; SCALE! names a compiled function:
 ;   Lambda-list: (C S)
 ;   Derived type: (FUNCTION (PIGMENT::RGBA SINGLE-FLOAT)
 ;                  (VALUES PIGMENT::RGBA &OPTIONAL))
 ;   Documentation:
 ;     scale by s in place.
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:TRANSPARENT

```
transparent.

 ; PIGMENT:TRANSPARENT
 ;   [symbol]
 ; 
 ; TRANSPARENT names a compiled function:
 ;   Lambda-list: (&OPTIONAL (A 0.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT)
 ;                  (VALUES PIGMENT::RGBA &OPTIONAL))
 ;   Documentation:
 ;     transparent.
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:VDARK

```
0.1

 ; PIGMENT:VDARK
 ;   [symbol]
 ; 
 ; VDARK names a compiled function:
 ;   Lambda-list: (&OPTIONAL (A 1.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT) *)
 ;   Documentation:
 ;     0.1
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:WHITE

```
white

 ; PIGMENT:WHITE
 ;   [symbol]
 ; 
 ; WHITE names a compiled function:
 ;   Lambda-list: (&OPTIONAL (A 1.0))
 ;   Derived type: (FUNCTION (&OPTIONAL SINGLE-FLOAT) *)
 ;   Documentation:
 ;     white
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:WITH

```
pre-multiplied (values ra ga ba a). ex: (with (pigment r g b a) (list r g b a)).

 ; PIGMENT:WITH
 ;   [symbol]
 ; 
 ; WITH names a macro:
 ;   Lambda-list: ((C R G B A) &BODY BODY)
 ;   Documentation:
 ;     pre-multiplied (values ra ga ba a). ex: (with (pigment r g b a) (list r g b a)).
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:WITH\*

```
(values r g b a). ex: (with (pigment r g b a) (list r g b a)).

 ; PIGMENT:WITH*
 ;   [symbol]
 ; 
 ; WITH* names a macro:
 ;   Lambda-list: ((C R G B A) &BODY BODY)
 ;   Documentation:
 ;     (values r g b a). ex: (with (pigment r g b a) (list r g b a)).
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

#### PIGMENT:YELLOW

```
yellow with s, v, a

 ; PIGMENT:YELLOW
 ;   [symbol]
 ; 
 ; YELLOW names a compiled function:
 ;   Lambda-list: (&KEY (SAT 1.0) (VAL 1.0) (ALPHA 1.0))
 ;   Derived type: (FUNCTION (&KEY (:SAT T) (:VAL T) (:ALPHA T)) *)
 ;   Documentation:
 ;     yellow with s, v, a
 ;   Source file: /data/x/auxin/src/draw/pigment.lisp
```

