#!/usr/local/bin/sbcl --script

(load "~/quicklisp/setup.lisp")
(ql:quickload :auxin)

(in-package :auxin)

(defun make-docs ()
  (loop for (o . rest) in (dat:import-all-data
                            (auxin:internal-path-string "src/packages") ".lisp")
        if (eq o 'defpackage)
        do (let* ((pkg (auxin:mkstr (car rest)))
                 (fn (auxin:internal-path-string (auxin:mkstr "docs/" pkg ".md")))
                 (s (with-output-to-string (*standard-output*)
                      (ext-symbols? pkg :pretty))))
             (with-open-file (fstream fn :direction :output :if-exists :supersede)
               (format fstream s)))))

(make-docs)

