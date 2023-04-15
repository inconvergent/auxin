
(in-package :rnd)


(veq:fvdef* 2on-line ((:va 2 a b))
  (declare #.*opt* (veq:ff a b))
  "random point between a,b."
  (veq:f2from a (f2!@- b a) (rnd)))

(veq:fvdef* 2non-line (n (:va 2 a b))
  (declare #.*opt* (veq:pn n) (veq:ff a b))
  "n random points between a,b."
  (veq:fwith-arrays (:n n :itr k
    :arr ((arr 2))
    :fxs ((f () (2on-line a b)))
    :exs ((arr k (f))))
    arr)
  ; TODO: port. need to call m@fx for every line?
  ; (labels ((fx () (2on-line a b)))
  ;   (f2!@$+! (veq:f2$zero n) (@_ (m*@fx)))) prject with symbol around fx?
  )


(veq:fvdef* 2in-rect ((:va 2 s))
  (declare #.*opt* (veq:ff s))
  "random point in rectangle of size sx,sy. centered at origin."
  (f2.@rnd* s))

(veq:fvdef* 2in-square (&optional (s 1f0))
  (declare #.*opt* (veq:ff s))
  "random point in square of size s. centered at origin."
  (2in-rect s s))

(veq:fvdef* 2nin-rect (n (:va 2 s))
  (declare #.*opt* (veq:pn n) (veq:ff s))
  "n random points in rectangle of size sx,sy. centered at origin."
  (veq:fwith-arrays (:n n :itr k
    :arr ((a 2))
    :fxs ((f () (2in-rect s)))
    :exs ((a k (f))))
    a))

(veq:fvdef* 2nin-square (n &optional (s 1f0))
  (declare #.*opt* (veq:pn n) (veq:ff s))
  "n random points in square of size s. centered at origin."
  (veq:fwith-arrays (:n n :itr k
    :arr ((a 2))
    :fxs ((f () (2in-square s)))
    :exs ((a k (f))))
    a))


(veq:fvdef* 2on-circ (&optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  "random point on circle with rad r. centered at origin."
  (f2!@*. (veq:fcos-sin (rnd veq:fpii)) r))

(veq:fvdef* 2non-circ (n &optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  "n random points on circle with rad r. centered at origin."
  (veq:fwith-arrays (:n n :itr k
    :arr ((a 2))
    :fxs ((f () (2on-circ r)))
    :exs ((a k (f))))
    a))

(veq:fvdef* 2in-circ (&optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  "random point in circle with rad r. centered at origin."
  (let ((a (rnd)) (b (rnd)))
    (declare (veq:ff a b))
    (if (< a b) (setf a (* veq:fpii (/ a b)) b (* b r))
                (let ((d a)) (setf a (* veq:fpii (/ b a)) b (* d r))))
    (values (* (cos a) b) (* (sin a) b))))

(veq:fvdef* 2nin-circ (n &optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  "n random points in circle with rad r. centered at origin."
  (veq:fwith-arrays (:n n :itr k
    :arr ((a 2))
    :fxs ((f () (2in-circ r)))
    :exs ((a k (f))))
    a))

