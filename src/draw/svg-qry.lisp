(in-package :wsvg/qry)

(defmacro gk (&rest rest) `(grph::gk ,@rest))

; merge this into wsvg?
(veq:fvdef stipple (pth &optional (s 2f0) (g s) &aux (l (+ s g)))
  (declare (pth:pth pth) (veq:ff s g l))
  (loop with len = (pth:@len pth)
        for x = (rnd:rnd g) then (+ x l)
        for xx = (min len (+ x s))
        while (< x len) collect (pth:lpos pth (/ x len) (/ xx len))))

(defun compile-selectors (body conf &aux (g (gk conf :gsym)) ($ (gk conf :$sym))
                                         (c (gk conf :closed-sym)))
  (labels
    ((kvsym (s) (grph::kv (veq::symb s)))
     (trigger-& (sym) (veq::match-substr ".&" (veq::mkstr sym)))
     (qry (conf) `(grph:qry ,g :select ,(gk conf :sel) :where ,(gk conf :where)))
     (car-is-& (body)
       (and (consp body) (symbolp (car body)) (trigger-& (car body))))
     (ctxfx (ctx fx) (ecase ctx (:ws `(,fx ,$ ,@(cdr body) :closed ,c))
                                ((:es :vs) `(,fx ,$ ,@(cdr body)))))
     (do&es (conf) `(loop for ,$ in ,(qry conf) for ,c = nil
                          do (progn ,@(gk conf :rest t))))
     (do&ww (conf) `(loop for (,$ ,c) in (grph:walk-edge-set ,g ,(qry conf))
                          do (progn ,@(gk conf :rest t))))
     (do&ws (conf) `(loop for (,$ ,c) in (grph:walk-edge-set-segments ,g ,(qry conf))
                          do (progn ,@(gk conf :rest t))))
     (do&vs (conf) `(loop for ,$ in ,(qry conf)
                          do (progn ,@(gk conf :rest t))))
     (tx (body ctx &aux (sym (car body)) (sep (trigger-& sym)))
       (let ((modifier (kvsym (subseq (veq::mkstr sym) 0 sep)))
             (fx (kvsym (subseq (veq::mkstr sym) (+ sep 2)))))
         (case fx (:es (dsb (x y where . rest) (cdr body)
                         (declare (symbol x y) (cons where))
                         (do&es `((:sel . (,x ,y)) (:where . ,where)
                                  (:rest . ,(rec rest fx)) ,@conf))))
                  (:ww (dsb (x y where . rest) (cdr body)
                         (declare (symbol x y) (cons where))
                         (do&ww `((:sel . (,x ,y)) (:where . ,where)
                                  (:rest . ,(rec rest fx)) ,@conf))))
                  (:ws (dsb (x y where . rest) (cdr body)
                         (declare (symbol x y) (cons where))
                         (do&ws `((:sel . (,x ,y)) (:where . ,where)
                                  (:rest . ,(rec rest fx)) ,@conf))))
                  (:vs (dsb (x where . rest) (cdr body)
                         (declare (symbol x) (cons where))
                         (do&vs `((:sel . ,x) (:where . ,where)
                                  (:rest . ,(rec rest fx)) ,@conf))))
                  (:stip `(stip ,$ ,@(cdr body) :closed ,c))
                  (:path `(path ,$ ,@(cdr body) :closed ,c))
                  (:jpath `(jpath ,$ ,@(cdr body) :closed ,c))
                  (:circ `(circ ,$ ,@(cdr body)))
                  (otherwise (ctxfx ctx (veq::symb fx))))))
     (rec (body &optional ctx)
       (cond ((atom body) body)
             ((car-is-& body) `(,@(tx body ctx)))
             ((consp body) (cons (rec (car body) ctx)
                                 (rec (cdr body) ctx))))))
    (rec body)))

(defmacro selectors ((g v wsvg) &body body)
  (declare (symbol g v wsvg))
  "use grph datalog selectors to draw directly from grph:grph g, and xgrph:pos v
(selectors (g v wsvg)
  (.&es ?x ?y (?x :path ?y) (rnd:prob 0.1 (.&path :sw 6.75 :so 0.85)))
  (.&vs ?x (and (or (?x :path ?y) (?y _ ?x))
              (% (<= (grph:num-either g ?x) 3)))
           (.&circ 8f0  :fill :black :so 0.8 :fo 0.8)))"
  `(labels
     ((2verts (l) (declare (list l)) (xgrph:2@verts ,v l))
      (2vert (i) (declare (veq:pn i)) (xgrph:2l@ ,v i))
      (circ (i rad &rest keys)
        (declare (veq:pn i) (veq:ff rad))
        (apply #'wsvg:circ ,wsvg rad :xy (2vert i) keys))
      (path (p &rest keys)
        (declare (list p))
        (apply #'wsvg:path ,wsvg (2verts p) keys))
      (jpath (p &rest keys)
        (declare (list p))
        (apply #'wsvg:jpath ,wsvg (2verts p) keys))
      (stip (p ss sg &rest keys &aux (keys* (strip-arg-keys keys '(:closed))))
        (declare (list p) (veq:ff ss sg))
        (loop with pth = (pth:make (2verts p) :dim 2
                           :closed (get-arg-key keys :closed))
              for l in (stipple pth ss sg)
              do (apply #'wsvg:path ,wsvg l keys*))))
     (progn ,@(compile-selectors body
                `((:gsym . ,g) (:vsym . ,v) (:$sym . ,(gensym "$"))
                  (:closed-sym . ,(gensym "CLOSED")))))))

