
(asdf:defsystem #:auxin
  :description "Auxiliary Utilities for Generative Art"
  :version "3.1.0"
  :author "anders hoff/inconvergent"
  :licence "MIT"
  :in-order-to ((asdf:test-op (asdf:test-op #:auxin/tests)))
  :pathname "src/"
  :serial nil
  :depends-on (#:lparallel #:cl-svg #:zpng #:veq #:lqn #:grph)
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
               (:file "fn" :depends-on ("utils"))
               (:file "gridfont/main" :depends-on ("utils"))
               (:file "draw/path" :depends-on ("utils"))
               (:file "draw/bzspl" :depends-on ("utils"))
               (:file "draw/pigment" :depends-on ("utils"))
               (:file "draw/ortho" :depends-on ("utils"))
               (:file "draw/simplify-path" :depends-on ("utils"))
               (:file "draw/jpath" :depends-on ("utils"))
               (:file "draw/svg" :depends-on ("draw/simplify-path" "draw/jpath"))
               (:file "draw/svg-qry" :depends-on ("draw/svg"))
               (:file "draw/canvas" :depends-on ("utils"))
               (:file "spatial/kdtree" :depends-on ("utils"))))

(asdf:defsystem #:auxin/tests
  :depends-on (#:auxin #:prove #:asdf #:uiop)
  :version "3.1.0"
  :perform (asdf:test-op (o s) (uiop:symbol-call ':auxin-tests '#:run-tests))
  :pathname "test/"
  :serial t
  :components ((:file "run")))

; TODO: unify simplify-path and path? and bzspl, and jpath
