#!/bin/bash

set -e
touch ./auxin.asd
time sbcl --quit \
         --eval '(load "~/quicklisp/setup.lisp")'\
         --eval '(load "auxin.asd")'\
         --eval '(handler-case (time (ql:quickload :auxin :verbose t))
                               (error (c) (print c) (sb-ext:quit :unix-status 2)))'\
  >compile.sh.tmp 2>&1
