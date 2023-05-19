
(defpackage #:auxin-tests (:use #:cl #:prove) (:export #:run-tests))
(in-package #:auxin-tests)

(setf prove:*enable-colors* nil)

(defparameter *files*
  (mapcar (lambda (p) (asdf:system-relative-pathname "auxin/tests" p))
          '(#P"test/rnd.lisp" #P"test/math.lisp"
            #P"test/hset.lisp" #P"test/pigment.lisp"
            #P"test/bzspl.lisp" #P"test/graph.lisp"
            #P"test/ortho.lisp")))

(defun run-tests ()
  (loop with fails = 0
        for f in *files*
        do (format t "~&~%starting tests in: ~a~%" (auxin:mkstr f))
           (unless (prove:run f :reporter :fiveam)
                   (incf fails))
           (format t "~&done: ~a~%" (auxin:mkstr f))
        finally (return (unless (< fails 1)
                          (uiop:quit 7)))))

