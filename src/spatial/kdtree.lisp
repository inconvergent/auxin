(in-package :kdtree)

; TODO: this is quite sloppy and could use some optimization.
;       check the qsort selection criterion
;       use index array instead of nodes

(declaim (inline %2rad))

(defstruct (node (:print-object prtnode) (:constructor node (k ind lft rht)))
  (lft nil :read-only t)
  (rht nil :read-only t)
  (k 0 :type veq:pn :read-only t)
  (ind 0 :type veq:pn :read-only t))

(defstruct (kdtree (:print-object prtkd) (:constructor -make-kdtree))
  (argsort nil :type veq:pvec :read-only nil)
  (n 0 :type veq:pn :read-only t)
  (cnt 0 :type veq:pn :read-only t)
  (vfx nil :type function :read-only t)
  (dfx nil :type function :read-only t)
  (node nil :type node :read-only t)
  (dim 0 :type veq:pn :read-only t))

(defun prtkd (o &optional s)
  (format s "<@~ad-tree ~a ~&  vfx: ~a~%  dfx: ~a>~%"
          (kdtree-dim o) (kdtree-n o) (kdtree-vfx o) (kdtree-dfx o)))
(defun prtnode (o &optional s)
  (format s "<@kdnode: ~a, ~a~%lft: ~a~%rht:~a>~%"
          (node-ind o) (node-k o) (node-lft o) (node-rht o)))

(veq:fvdef -qsrt (argsort vfx dfx &key dim (k 0) (lo 0) hi)
  "construct a kd tree of dim using quicksort for partitioning.
argsort will contain the index into the spatial data in a."
  (declare #.*opt* (veq:pvec argsort) (function vfx dfx)
                   (veq:pn dim k ) (veq:in hi lo))
  (cond ((= hi lo) (return-from -qsrt (node k hi nil nil)))
        ((> lo hi) (return-from -qsrt nil)))
  (labels ((kget (i) (declare (veq:pn i)) (funcall vfx (aref argsort i) k))
           (kpart (lo hi) (declare (veq:pn lo hi))
             (loop with pivot of-type veq:ff = (kget hi)
                   with i of-type veq:in = (- lo 1)
                   for j from lo to hi
                   if (<= (kget j) pivot)
                   do (incf i) (rotatef (aref argsort i) (aref argsort j))
                   finally (return-from kpart i))))
    (veq:xlet ((p!p (kpart lo hi)) (p!k* (mod (1+ k) dim)))
      (node k p (-qsrt argsort vfx dfx :dim dim :k k* :lo lo :hi (- p 1))
                (-qsrt argsort vfx dfx :dim dim :k k* :lo (+ p 1) :hi hi)))))

(defun make (n vfx dfx &optional (dim 2))
  (let ((argsort (make-array n :adjustable nil :element-type 'veq:pn
                   :initial-contents (loop for i of-type veq:pn
                                           from 0 below n collect i))))
    (declare (veq:pvec argsort))
    "construct kd tree. eg, for 100 2d pts in a vec:
  (kdtree:make 100 (lambda (i k) (declare (veq:pn i k))
                     (aref verts (+ (* i 2) k)))
                   (lambda (i (:va 2 x)) (declare (veq:pn i) (veq:ff x))
                     (veq:f2dst2 (veq:2$ verts i) x)))"
    (-make-kdtree :n n :dim dim :argsort argsort :vfx vfx :dfx dfx
                  :node (-qsrt argsort vfx dfx :dim dim :hi (1- n)))))

; TODO: 3rad/3nn. 2/3 macro?

(veq:fvdef* 2rad (kd r (:va 2 x) &aux (r2 (* r r)) (res (list)))
  "get indices of all verts in rad around x"
  (declare #.*opt* (kdtree kd) (veq:ff x r r2) (list res))
  (with-struct (kdtree- argsort vfx dfx) kd
    (declare (veq:pvec argsort) (function vfx dfx))
    (labels ((kget (i k) (declare (veq:pn i k)) (funcall vfx (aref argsort i) k))
             (xdst2 (i) (declare (veq:pn i)) (funcall dfx (aref argsort i) x))
             (rad (node)
               (when (not node) (return-from rad))
               (with-struct (node- ind k lft rht) (the node node)
                 (declare (veq:pn ind k))
                 (veq:xlet ((f!xv (case k (0 (:vr x 0)) (otherwise (:vr x 1))))
                            (f!nv (kget ind k))
                            (f!axdst2 (expt (abs (- xv nv)) 2f0))
                            (f!dst2 (xdst2 ind)))
                   (when (< dst2 r2) (push (aref argsort ind) res))
                   (if (> r2 axdst2) (progn (rad lft) (rad rht))
                                     (rad (if (<= xv nv) lft rht)))))))
      (rad (kdtree-node kd))
      res)))

; TODO: finish 2d/3d, and/or make macro wrapper

; (veq:fvdef* 2nn (wer (:va 2 x) &aux (res -1) (resdst2 0f0))
;   "get index of nearest neighbour of x."
;   (declare #.*opt* (weir wer) (veq:ff x resdst2) (veq:in res))

;   (with-struct (weir- kdtree verts dim) wer
;     (declare (veq:fvec verts) (veq:in dim))
;     (with-struct (kdtree- argsort) kdtree
;       (declare (index-array argsort))
;       (labels
;         ((leapget (leap ind)
;            (declare #.*opt* (veq:in leap ind))
;            (aref verts (-ind argsort dim ind leap)))

;          (xdst2 (ind)
;            (declare #.*opt* (veq:in ind))
;            (veq:f2dst2 x (veq:f2$ verts (aref argsort ind))))

;          (-nn (node)
;            (declare #.*opt*)
;            (when (not node) (return-from -nn))
;            (with-struct (node- ind leap lft rht) node
;              (declare (veq:pn ind leap))
;              (let* ((xv (case leap (0 (:vref x 0)) (otherwise (:vref x 1))))
;                     (nv (leapget leap ind))
;                     (axdst2 (expt (- xv nv) 2f0))
;                     (dst2 (xdst2 ind)))
;                (declare (veq:ff xv nv axdst2 dst2))

;                (when (< dst2 resdst2)
;                      (setf res (aref argsort ind) resdst2 dst2))
;                (if (> resdst2 axdst2)
;                    (progn (-nn lft) (-nn rht))
;                    (-nn (if (<= xv nv) lft rht)))))))

;       (let ((node (kdtree-node kdtree)))
;         (declare (node node))
;         (setf res (aref argsort (node-ind node))
;               resdst2 (xdst2 (aref argsort (node-ind node))))
;         (-nn node))
;       (values res (sqrt resdst2))))))


; (veq:fvdef* 3nn (wer (:varg 3 x) &aux (res -1) (resdst2 0f0))
;   "get index of nearest neighbour of x."
;   (declare #.*opt* (weir wer) (veq:ff x resdst2) (veq:in res))

;   (with-struct (weir- kdtree verts dim) wer
;     (declare (veq:fvec verts) (veq:in dim))
;     (with-struct (kdtree- argsort) kdtree
;       (declare (index-array argsort))
;       (labels
;         ((leapget (leap ind)
;            (declare #.*opt* (veq:in leap ind))
;            (aref verts (-ind argsort dim ind leap)))

;          (xdst2 (ind)
;            (declare #.*opt* (veq:in ind))
;            (veq:f3dst2 x (veq:f3$ verts (aref argsort ind))))

;          (-nn (node)
;            (declare #.*opt*)
;            (when (not node) (return-from -nn))
;            (with-struct (node- ind leap lft rht) node
;              (declare (veq:pn ind leap))
;              (let* ((xv (case leap (0 (:vref x 0))
;                                    (1 (:vref x 1))
;                                    (otherwise (:vref x 2))))
;                     (nv (leapget leap ind))
;                     (axdst2 (expt (- xv nv) 2f0))
;                     (dst2 (xdst2 ind)))
;                (declare (veq:ff xv nv axdst2 dst2))

;                (when (< dst2 resdst2)
;                      (setf res (aref argsort ind) resdst2 dst2))
;                (if (> resdst2 axdst2)
;                    (progn (-nn lft) (-nn rht))
;                    (-nn (if (<= xv nv) lft rht)))))))

;       (let ((node (kdtree-node kdtree)))
;         (declare (node node))
;         (setf res (aref argsort (node-ind node))
;               resdst2 (xdst2 (aref argsort (node-ind node))))
;         (-nn node))
;       (values res (sqrt resdst2))))))

