#!/usr/local/bin/sbcl --script

(load "~/quicklisp/setup.lisp")

(ql:quickload :auxin)
(ql:quickload :cl-json) ; json docs https://common-lisp.net/project/cl-json/cl-json.html

(defun load-export-font-dat (fn)
  (with-open-file (f (auxin:ensure-filename fn ".json" t) :direction :input)
    (dat:export-data (json:decode-json f) fn ".dat" t)))

(veq:fvdef main ()
  (load-export-font-dat (auxin::internal-path-string "src/gridfont/smooth"))
  (load-export-font-dat (auxin::internal-path-string "src/gridfont/original"))
  ; (let ((gf (gridfont:make)))
  ;   (print (gridfont:wc gf :|:|)))
  )

(main)

