

(asdf:defsystem #:auxin
  :description "Auxiliary Utilities for Generative Art"
  :version "0.1.1"
  :author "anders hoff/inconvergent"
  :licence "MIT"
  :in-order-to ((asdf:test-op (asdf:test-op #:auxin/tests)))
  :pathname "src/"
  :serial nil
  :depends-on (#:veq #:lparallel #:alexandria #:cl-json #:cl-svg #:zpng)
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
               (:file "rnd/macros" :depends-on ("utils"))
               (:file "rnd/rnd" :depends-on ("rnd/macros"))
               (:file "rnd/2rnd" :depends-on ("rnd/rnd"))
               (:file "rnd/3rnd" :depends-on ("rnd/rnd"))
               (:file "rnd/walkers" :depends-on ("rnd/2rnd" "rnd/3rnd"))
               (:file "fn" :depends-on ("rnd/rnd"))
               (:file "gridfont/main" :depends-on ("utils"))
               (:file "draw/bzspl" :depends-on ("rnd/rnd"))
               (:file "draw/pigment" :depends-on ("utils"))
               (:file "draw/ortho" :depends-on ("utils"))
               (:file "draw/simplify-path" :depends-on ("utils"))
               (:file "draw/jpath" :depends-on ("utils"))
               (:file "draw/svg" :depends-on ("draw/simplify-path" "draw/jpath"))
               (:file "graph/main" :depends-on ("hset"))
               (:file "graph/paths" :depends-on ("graph/main"))
               (:file "graph/edge-set" :depends-on ("graph/main"))
               (:file "graph/mst-cycle" :depends-on ("graph/main"))
               (:file "draw/canvas" :depends-on ("utils"))))


(asdf:defsystem #:auxin/tests
  :depends-on (#:auxin #:prove #:asdf #:uiop)
  :version "0.1.1"
  :perform (asdf:test-op (o s) (uiop:symbol-call ':auxin-tests '#:run-tests))
  :pathname "test/"
  :serial t
  :components ((:file "run")))

