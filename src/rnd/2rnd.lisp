
(in-package :rnd)


(declaim (inline %2on-line %2non-line %2in-rect %2in-square %2nin-rect
                 %2nin-square %2on-circ %2non-circ %2in-circ %2nin-circ))

(veq:fvdef* 2on-line ((:va 2 a b))
  (declare #.*opt* (veq:ff a b)) "random point between a,b."
  (veq:f2from a (f2!@- b a) (rnd)))
(veq:fvdef* 2non-line (n (:va 2 a b))
  (declare #.*opt* (veq:pn n) (veq:ff a b)) "n random points between a,b."
  (f2!@$+! (veq:f2$zero n) (?@ (2on-line a b))))

(veq:fvdef* 2in-rect ((:va 2 s))
  (declare #.*opt* (veq:ff s)) "random point in rectangle of size sx,sy. centered at origin."
  (f2.@rnd* s))
(veq:fvdef* 2in-square (&optional (s 1f0))
  (declare #.*opt* (veq:ff s)) "random point in square of size s. centered at origin."
  (2in-rect s s))

(veq:fvdef* 2nin-rect (n (:va 2 s))
  (declare #.*opt* (veq:pn n) (veq:ff s))
  "n random points in rectangle of size sx,sy. centered at origin."
  (f2!@$+! (veq:f2$zero n) (?@ (2in-rect s))))
(veq:fvdef* 2nin-square (n &optional (s 1f0))
  (declare #.*opt* (veq:pn n) (veq:ff s))
  "n random points in square of size s. centered at origin."
  (f2!@$+! (veq:f2$zero n) (?@ (2in-square s))))

(veq:fvdef* 2on-circ (&optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  "random point on circle with rad r. centered at origin."
  (f2!@*. (veq:fcos-sin (rnd veq:fpii)) r))
(veq:fvdef* 2non-circ (n &optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  "n random points on circle with rad r. centered at origin."
  (f2!@$+! (veq:f2$zero n) (?@ (2on-circ r))))

(veq:fvdef* 2in-circ (&optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  "random point in circle with rad r. centered at origin."
  (veq:xlet ((f!a (rnd)) (f!b (rnd)))
    (if (< a b) (setf a (* veq:fpii (/ a b)) b (* b r))
                (veq:xlet ((f!d a)) (setf a (* veq:fpii (/ b a)) b (* d r))))
    (values (* (cos a) b) (* (sin a) b))))
(veq:fvdef* 2nin-circ (n &optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  "n random points in circle with rad r. centered at origin."
  (f2!@$+! (veq:f2$zero n) (?@ (2in-circ r))))

; TODO: this is pretty inefficient. in terms of time and RAM
; some version of mitchell's best candidate algorithm
(veq:fvdef 2ndistsample (want fx &key (res (auxin:make-adjustable-vector))
                                      (sample-num 50) (dstfx #'veq::-f2dst2)
                                      (min-dst -1f0) (max-tries want))
  (declare (fixnum sample-num) (function fx dstfx) (array res))
  "add want additional samples to res from batches of (f@fx sample-num),
   always selecting the element furthest from existing elemets.
     example: (rnd:max-distance-sample 100 (lambda (n) (rnd:nin-circ n 400f0)))"
  (labels ((arrmin ((:va 2 x) &aux (l (length res)))
             (if (> l 0) (loop for i from 0 repeat l
                               minimizing (f@dstfx (veq:f2$ (aref res i)) x))
                         999999999f0)))
    (loop with wanted-length of-type fixnum = (+ want (length res))
          repeat max-tries until (>= (length res) wanted-length)
          do (veq:xlet ((p!ind 0) (cands (f@fx sample-num))
                        (dd (f21%@$ cands (((:va 2 x)) (veq:ff (m@arrmin x)))))
                        (f!dst (veq:f$ dd ind)))
               (fx@$ dd ((i d) (when (and (<= min-dst d) (<= dst d))
                                     (setf ind i dst d))))
               (when (<= min-dst dst)
                     (auxin:vextend (veq:f2$point (veq:f2$ cands ind)) res)))))
  res)

