(in-package :wsvg/qry)

(defmacro gk (&rest rest) `(grph::gk ,@rest))

; stipple is visually unstable in some cases. maybe always start path on the
; lowest vertex index?

(defmacro grph-walk (g path default es)
  (declare (symbol g))
  `(lqn:qry (grph:walk (,g o c sid) ((collect compound dir ,default ,path) :es ,es)
                       (list sid o c))
            (?grp (car _) (cons :path (cdr _)))))

(defun proc-grph-draw (body conf &aux (g (gk conf :gsym)) ($ (gk conf :$sym))
                                         (c (gk conf :closed-sym)))
  (labels
    ((kvsym (s) (grph::kv (veq::symb s)))
     (trigger-& (sym) (veq::match-substr ".&" (veq::mkstr sym)))
     (qry (conf) `(grph:qry ,g :select ,(gk conf :sel) :where ,(gk conf :where)))
     (car-is-& (body) (and (consp body)
                           (symbolp (car body))
                           (trigger-& (car body))))

     (do-vs   (conf) `(loop for ,$ in ,(qry conf) do (progn ,@(gk conf :rest t))))
     (do-wlk  (p conf) `(grph:walk (,g ,$ ,c) ((dir ,p) :es ,(qry conf))
                          ,@(gk conf :rest t)) )
     (do-cpnd (def p conf)
       `(loop with walk = (grph-walk ,g ,def ,p ,(qry conf))
              for sid being the hash-keys of walk using (hash-value ,$)
              if (eql sid :/g/_default/) do (loop for x across ,$ for ,$ = `#(,x)
                                                  do (progn ,@(gk conf :rest t)))
              else do (progn ,@(gk conf :rest t))))

     (new-conf (s w rest) `((:sel . ,s) (:where . ,w) (:rest . ,rest) ,@conf))
     (tx (body ctx &aux (sym (car body))
                        (fx (kvsym (subseq (veq::mkstr sym) (+ (trigger-& sym) 2)))))
       (declare (ignorable ctx)) ; maybe useful
       (ecase fx
         (:stip      `(-stip  ,$ ,@(cdr body) :closed ,c))
         (:path      `(-path  ,$ ,@(cdr body) :closed ,c))
         (:jpath     `(-jpath ,$ ,@(cdr body) :closed ,c))
         (:circ      `(-circ  ,$ ,@(cdr body)))
         (:compound  `(-cpnd  ,$ ,@(cdr body)))
         (:es    (dsb (x y where . rest) (cdr body) #1=(declare (symbol x y) (cons where))
                      (do-wlk :edges #2=(new-conf `(,x ,y) where (rec rest fx)))))
         (:ww    (dsb (x y where . rest) (cdr body) #1# (do-wlk :paths           #2#)))
         (:ws    (dsb (x y where . rest) (cdr body) #1# (do-wlk :segments        #2#)))
         (:vs    (dsb (x   where . rest) (cdr body)
                      (declare (symbol x) (cons where))
                      (do-vs (new-conf x where (rec rest fx)))))
         (:c*/es (dsb (x y where . rest) (cdr body) #1# (do-cpnd :drop :edges    #2#)))
         (:c*/ws (dsb (x y where . rest) (cdr body) #1# (do-cpnd :drop :segments #2#)))
         (:c*/ww (dsb (x y where . rest) (cdr body) #1# (do-cpnd :drop :paths    #2#)))
         (:c/es  (dsb (x y where . rest) (cdr body) #1# (do-cpnd :keep :edges    #2#)))
         (:c/ws  (dsb (x y where . rest) (cdr body) #1# (do-cpnd :keep :segments #2#)))
         (:c/ww  (dsb (x y where . rest) (cdr body) #1# (do-cpnd :keep :paths    #2#)))))
     (rec (body &optional ctx) (cond ((atom body) body)
                                     ((car-is-& body) `(,@(tx body ctx)))
                                     ((consp body) (cons (rec (car body) ctx)
                                                         (rec (cdr body) ctx))))))
    (rec body)))

(defmacro grph-draw ((g v wsvg &key (sym (gensym "$"))) &body body)
  (declare (symbol g v wsvg))
  "use grph datalog queries to draw directly from grph:grph g, and xgrph:pos v
(grph-draw (g v wsvg)
  (.&es ?x ?y (?x :path ?y) (rnd:prob 0.1 (.&path :sw 6.75 :so 0.85)))
  (.&vs ?x (and (or (?x :path ?y) (?y _ ?x))
              (% (<= (grph:num-either g ?x) 3)))
           (.&circ 8f0  :fill :black :so 0.8 :fo 0.8)))

see proc-grph-draw
  " `(labels
     ((-2verts (l) (declare (list l)) (xgrph:2@verts ,v l))
      (-2vert (i) (declare (veq:pn i)) (xgrph:2l@ ,v i))
      (-circ (i rad &rest keys) (declare (veq:pn i) (veq:ff rad))
        (apply #'wsvg:circ ,wsvg rad :xy (-2vert i) keys))
      (-path (p &rest keys) (declare (list p))
        (apply #'wsvg:path ,wsvg (-2verts p) keys))
      (-jpath (p &rest keys) (declare (list p))
        (apply #'wsvg:jpath ,wsvg (-2verts p) keys))
      (-stip (p ss sg &rest keys) (declare (list p) (veq:ff ss sg))
        (apply #'wsvg:stipple ,wsvg (-2verts p) ss sg keys))
      (-cpnd (p &rest keys) (declare (vector p))
        (apply #'wsvg::compound ,wsvg
               (map 'vector (lambda (l) (dsb (ty part c) l
                                             (list ty (-2verts part) c))) p)
               keys)))
     (progn ,@(proc-grph-draw body `((:gsym . ,g) (:vsym . ,v) (:$sym . ,sym)
                                        (:closed-sym . ,(gensym "CLOSED")))))))

