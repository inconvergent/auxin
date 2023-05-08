#### ORTHO:@CAM

```
:missing:todo:

 ; ORTHO:@CAM
 ;   [symbol]
 ; 
 ; @CAM names a compiled function:
 ;   Lambda-list: (PROJ)
 ;   Derived type: (FUNCTION (T)
 ;                  (VALUES SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT
 ;                          &OPTIONAL))
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/draw/ortho.lisp
```

#### ORTHO:@UP

```
:missing:todo:

 ; ORTHO:@UP
 ;   [symbol]
 ; 
 ; @UP names a compiled function:
 ;   Lambda-list: (PROJ)
 ;   Derived type: (FUNCTION (T)
 ;                  (VALUES SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT
 ;                          &OPTIONAL))
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/draw/ortho.lisp
```

#### ORTHO:@VPN

```
:missing:todo:

 ; ORTHO:@VPN
 ;   [symbol]
 ; 
 ; @VPN names a compiled function:
 ;   Lambda-list: (PROJ)
 ;   Derived type: (FUNCTION (T)
 ;                  (VALUES SINGLE-FLOAT SINGLE-FLOAT SINGLE-FLOAT
 ;                          &OPTIONAL))
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/draw/ortho.lisp
```

#### ORTHO:@XY

```
:missing:todo:

 ; ORTHO:@XY
 ;   [symbol]
 ; 
 ; @XY names a compiled function:
 ;   Lambda-list: (PROJ)
 ;   Derived type: (FUNCTION (T)
 ;                  (VALUES SINGLE-FLOAT SINGLE-FLOAT &OPTIONAL))
 ;   Inline proclamation: INLINE (inline expansion available)
 ;   Source file: /data/x/auxin/src/draw/ortho.lisp
```

#### ORTHO:EXPORT-DATA

```
 ; ORTHO:EXPORT-DATA
 ;   [symbol]
 ; 
 ; EXPORT-DATA names a compiled function:
 ;   Lambda-list: (P)
 ;   Derived type: (FUNCTION (ORTHO::ORTHO) (VALUES CONS &OPTIONAL))
 ;   Documentation:
 ;     export the neccessary values to recreate ortho
 ;   Source file: /data/x/auxin/src/draw/ortho.lisp
```

#### ORTHO:IMPORT-DATA

```
 ; ORTHO:IMPORT-DATA
 ;   [symbol]
 ; 
 ; IMPORT-DATA names a compiled function:
 ;   Lambda-list: (P)
 ;   Derived type: (FUNCTION (LIST) *)
 ;   Documentation:
 ;     recreate proj from an a list exported by ortho:export-data
 ;   Source file: /data/x/auxin/src/draw/ortho.lisp
```

#### ORTHO:MAKE

```
 ; ORTHO:MAKE
 ;   [symbol]
 ; 
 ; MAKE names a compiled function:
 ;   Lambda-list: (&KEY (UP (F3$POINT 0.0 0.0 1.0))
 ;                 (CAM (F3$POINT 1000.0 1000.0 1000.0))
 ;                 (XY (F2$POINT 500.0 500.0)) (S 1.0) VPN LOOK
 ;                 (RAYLEN 5000.0))
 ;   Derived type: (FUNCTION
 ;                  (&KEY (:UP (SIMPLE-ARRAY SINGLE-FLOAT))
 ;                   (:CAM (SIMPLE-ARRAY SINGLE-FLOAT))
 ;                   (:XY (SIMPLE-ARRAY SINGLE-FLOAT)) (:S SINGLE-FLOAT)
 ;                   (:VPN T) (:LOOK T) (:RAYLEN SINGLE-FLOAT))
 ;                  (VALUES ORTHO::ORTHO &OPTIONAL))
 ;   Documentation:
 ;     
 ;       make projection.
 ;     
 ;       default up is (0 0 1)
 ;       default cam is (1000 1000 1000)
 ;       if look and vpn are unset, the camera will look at the origin.
 ;     
 ;       default scale is 1
 ;       default xy is (0 0)
 ; 
 ;   Source file: /data/x/auxin/src/draw/ortho.lisp
```

#### ORTHO:MAKE-RAYFX

```
 ; ORTHO:MAKE-RAYFX
 ;   [symbol]
 ; 
 ; MAKE-RAYFX names a compiled function:
 ;   Lambda-list: (PROJ)
 ;   Derived type: (FUNCTION (ORTHO::ORTHO) (VALUES FUNCTION &OPTIONAL))
 ;   Documentation:
 ;     cast a ray in direction -vpn from pt
 ;   Source file: /data/x/auxin/src/draw/ortho.lisp
```

#### ORTHO:PAN-CAM

```
:missing:todo:

 ; ORTHO:PAN-CAM
 ;   [symbol]
```

#### ORTHO:PAN-XY

```
:missing:todo:

 ; ORTHO:PAN-XY
 ;   [symbol]
```

#### ORTHO:PROJECT

```
 ; ORTHO:PROJECT
 ;   [symbol]
 ; 
 ; PROJECT names a macro:
 ;   Lambda-list: (&REST REST)
 ;   Documentation:
 ;     WRAPS: %PROJECT
 ;     ARGS: (PROJ (VA 3 PT))
 ;     DOCSTRING: project single point. returns (values x y d)
 ;     defined via veq:FVDEF*
 ;   Source file: /data/x/auxin/src/draw/ortho.lisp
```

#### ORTHO:PROJECT\*

```
 ; ORTHO:PROJECT*
 ;   [symbol]
 ; 
 ; PROJECT* names a compiled function:
 ;   Lambda-list: (PROJ PATH)
 ;   Derived type: (FUNCTION (ORTHO::ORTHO (SIMPLE-ARRAY SINGLE-FLOAT))
 ;                  (VALUES (SIMPLE-ARRAY SINGLE-FLOAT . #1=((*)))
 ;                          (SIMPLE-ARRAY SINGLE-FLOAT . #1#) &OPTIONAL))
 ;   Documentation:
 ;     project a path #(x1 y1 z1 x2 y2 z2 ...).
 ;        returns projected path and distances:
 ;     (values #(px1 py1 px2 py2 ...) #(d1 d2 ...))
 ;   Source file: /data/x/auxin/src/draw/ortho.lisp
```

#### ORTHO:PROJECT-OFFSET

```
:missing:todo:

 ; ORTHO:PROJECT-OFFSET
 ;   [symbol]
```

#### ORTHO:PROJECT-OFFSET\*

```
:missing:todo:

 ; ORTHO:PROJECT-OFFSET*
 ;   [symbol]
```

#### ORTHO:ROTATE

```
:missing:todo:

 ; ORTHO:ROTATE
 ;   [symbol]
```

#### ORTHO:UPDATE

```
 ; ORTHO:UPDATE
 ;   [symbol]
 ; 
 ; UPDATE names a compiled function:
 ;   Lambda-list: (PROJ &KEY S XY UP CAM VPN LOOK)
 ;   Derived type: (FUNCTION
 ;                  (ORTHO::ORTHO &KEY (:S T) (:XY T) (:UP T) (:CAM T)
 ;                   (:VPN T) (:LOOK T))
 ;                  (VALUES ORTHO::ORTHO &OPTIONAL))
 ;   Documentation:
 ;     
 ;       update projection parameters.
 ;     
 ;       use vpn to set view plane normal directly, or look to set view plane normal
 ;       relative to camera.
 ;     
 ;       ensures that internal state is updated appropriately.
 ; 
 ;   Source file: /data/x/auxin/src/draw/ortho.lisp
```

#### ORTHO:ZOOM

```
:missing:todo:

 ; ORTHO:ZOOM
 ;   [symbol]
```

