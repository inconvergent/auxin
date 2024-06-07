#!/usr/local/bin/sbcl --script

(load "~/quicklisp/setup.lisp")
(ql:quickload :auxin) (in-package :auxin)

(defun make-docs ()
  (loop for (o . rest) in (dat:import-all-data (internal-path-string "src/packages") ".lisp")
        for pkg = (mkstr (car rest))
        for fn = (internal-path-string (format nil "docs/~(~a~).md" (veq::repl pkg "/" "-")))
        if (eq o 'defpackage)
        do (with-open-file (fs fn :direction :output :if-exists :supersede)
             (princ (-outstr (ext-symbols? pkg :pretty)) fs))))
(make-docs)

