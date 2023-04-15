#!/usr/local/bin/sbcl --script

(load "~/quicklisp/setup.lisp")

(let ((*features* (cons :veq-reader-macros *features*)))
(ql:quickload :auxin))



(veq:fvdef main ()

  ; (labels ((fx () (values (random 1f0) (random 1f0))))
  ;   (veq:vpr (f2!@$+! (veq:f2$zero 10) (m@fx))))


  (veq:mac* (rnd:3in-box 3f0 4f0 5f0))
  (veq:mac* (rnd:2in-rect 30f0 40f0))

; (veq:fvdef* 2in-rect ((:va 2 s))
;   (veq:mac* (f2.@rnd* s))
;   )

  ; (labels ((fx (x y z) (values y (+ x z))))
  ;   (veq:vpr (2_@$fx. (veq:i2$line 1 2 3 4) 10)))

  )


(main)

