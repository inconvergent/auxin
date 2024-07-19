#!/bin/bash

set -e
touch ./auxin.asd
time sbcl --quit \
         --eval '(load "auxin.asd")'\
         --eval '(handler-case (time (ql:quickload :auxin :verbose t))
                               (error (c) (print c) (sb-ext:quit :unix-status 2)))'\
  >compile.sh.log 2>&1
