
(asdf:defsystem #:auxin
  :description "Auxiliary Utilities for Generative Art"
  :version "1.0.0"
  :author "anders hoff/inconvergent"
  :licence "MIT"
  :in-order-to ((asdf:test-op (asdf:test-op #:auxin/tests)))
  :pathname "src/"
  :serial nil
  :depends-on (#:veq #:lparallel #:cl-json #:cl-svg #:zpng)
  :components ((:file "packages")
               (:file "init" :depends-on ("packages"))
               (:file "config" :depends-on ("init"))
               (:file "utils" :depends-on ("config"))
               (:file "parallel/main" :depends-on ("utils"))
               (:file "dat" :depends-on ("utils"))
               (:file "docs" :depends-on ("dat"))
               (:file "state" :depends-on ("utils"))
               (:file "hset" :depends-on ("utils"))
               (:file "math" :depends-on ("utils"))
               (:file "rnd/srnd" :depends-on ("utils"))
               (:file "rnd/macros" :depends-on ("utils"))
               (:file "rnd/rnd" :depends-on ("rnd/macros"))
               (:file "rnd/2rnd" :depends-on ("rnd/rnd"))
               (:file "rnd/3rnd" :depends-on ("rnd/rnd"))
               (:file "rnd/walkers" :depends-on ("rnd/2rnd" "rnd/3rnd"))
               (:file "fn" :depends-on ("rnd/rnd"))
               (:file "gridfont/main" :depends-on ("utils"))
               (:file "draw/path" :depends-on ("rnd/rnd"))
               (:file "draw/bzspl" :depends-on ("rnd/rnd"))
               (:file "draw/pigment" :depends-on ("utils"))
               (:file "draw/ortho" :depends-on ("utils"))
               (:file "draw/simplify-path" :depends-on ("utils"))
               (:file "draw/jpath" :depends-on ("utils"))
               (:file "draw/svg" :depends-on ("draw/simplify-path" "draw/jpath"))
               (:file "draw/canvas" :depends-on ("utils"))))

(asdf:defsystem #:auxin/tests
  :depends-on (#:auxin #:prove #:asdf #:uiop)
  :version "1.0.0"
  :perform (asdf:test-op (o s) (uiop:symbol-call ':auxin-tests '#:run-tests))
  :pathname "test/"
  :serial t
  :components ((:file "run")))

; TODO: unify simplify-path and path? and bzspl, and jpath
