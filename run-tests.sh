#!/bin/bash

set -e

sbcl --quit \
     --eval '(handler-case (ql:quickload :auxin :verbose t)
               (error (c) (format t "STAGE1FAIL: ~a" c)
                          (sb-ext:quit :unix-status 2)))'

sbcl --quit \
     --eval '(ql:quickload :prove :verbose nil)'\
     --eval '(handler-case (asdf:test-system :auxin)
               (error (c) (format t "STAGE2FAIL: ~a" c)
                          (sb-ext:quit :unix-status 3)))'
