
(in-package :simplify)

(deftype int-vector () `(vector veq:pn))

; TODO: make 3d version similar to vert-utils?

(veq:fvdef -simplify (pts lim &key left right)
  (declare #.*opt* (veq:fvec pts) (veq:ff lim) (veq:pn left right))
  (veq:xlet ((res (make-adjustable-vector :type 'veq:pn))
             (f!dmax -1f0)
             (p!index 0)
             (f2!sl (veq:f2$ pts left))
             (f2!sr (veq:f2$ pts right)))
    (declare (int-vector res))
    (loop for i of-type veq:pn from (1+ left) below right
          for d of-type veq:ff = (veq:f2segdst sl sr (veq:f2$ pts i))
          if (> d dmax) do (setf dmax d index i))
    (if (> dmax lim)
        (progn (loop with ps of-type int-vector =
                       (-simplify pts lim :left left :right index)
                     for i from 0 below (1- (length ps))
                     do (vextend (aref ps i) res))
               (loop for i across (-simplify pts lim :left index :right right)
                     do (vextend i res)))
        (progn (vextend left res)
               (vextend right res)))
    (sort res #'<)))


; https://hydra.hull.ac.uk/resources/hull:8338
(defun path (pts &key (lim 1f0) &aux (inds (-simplify pts lim :left 0 :right (1- (round (length pts) 2)))))
  (declare #.*opt* (veq:fvec pts) (veq:ff lim) (vector inds))
  "simplify path, pts. lim is the distance of candidate pt to candidate line
returns new path"
  ; this is kind of inefficient. but it works just fine.
  (values (veq:f$_ (loop for i of-type veq:pn across inds
                         collect (veq:lst (veq:f2$ pts i)) of-type list))
          inds))

