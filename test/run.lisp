
(defpackage #:auxin-tests (:use #:cl #:prove) (:export #:run-tests))
(in-package #:auxin-tests)

; (declaim (optimize speed (safety 2)))

(setf prove:*enable-colors* nil)

(defmacro is-arr (&rest rest) `(is ,@rest :test #'equalp))

(defparameter *files*
  (mapcar (lambda (p) (asdf:system-relative-pathname "auxin/tests" p))
          '(#P"test/math.lisp" #P"test/hset.lisp"
            #P"test/pigment.lisp" #P"test/paths.lisp" #P"test/ortho.lisp"
            #P"test/kdtree.lisp")))

(defun run-tests ()
  (loop with fails = 0
        for f in *files*
        do (format t "~&~%starting tests in: ~a~%" (auxin:mkstr f))
           (unless (prove:run f :reporter :fiveam)
                   (incf fails))
           (format t "~&done: ~a~%" (auxin:mkstr f))
        finally (return (unless (< fails 1)
                          (uiop:quit 7)))))

