
(in-package :rnd)

(declaim (inline 3on-sphere 3in-sphere 3non-sphere %3on-line 3nin-sphere
                 %3non-line %3in-box %3nin-box %3nin-cube))

(veq:fvdef* 3on-line ((:va 3 a b))
  (declare #.*opt* (veq:ff a b)) "random point between a,b."
  (veq:f3from a (f3!@- b a) (rnd)))
(veq:fvdef* 3non-line (n (:va 3 a b))
  (declare #.*opt* (veq:ff a b)) "n random points between a,b."
  (f3!@$+! (veq:f3$zero n) (?@ (3on-line a b))))


(veq:fvdef* 3in-box ((:va 3 s))
  (declare #.*opt* (veq:ff s)) "random point in box of size sx,sy,sz. centered at origin."
  (f3.@rnd* s))
(veq:fvdef* 3in-cube (&optional (s 1f0))
  (declare #.*opt* (veq:ff s)) "random point in cube of size s. centered at origin."
  (3in-box s s s))

(veq:fvdef* 3nin-box (n (:va 3 s))
  (declare #.*opt* (veq:ff s)) "n random points in box of size sx,sy,sz. centered at origin."
  (f3!@$+! (veq:f3$zero n) (?@ (3in-box s))))
(veq:fvdef 3nin-cube (n &optional (s 1f0))
  (declare #.*opt* (veq:ff s)) "n random points in cube of size sx. centered at origin."
  (f3!@$+! (veq:f3$zero n) (?@ (3in-cube s))))

(veq:fvdef 3on-sphere-slow (&optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  "random point on sphere with rad r. centered at origin. slower than 3on-sphere."
  (labels ((-norm () (veq:xlet ((f!u (rnd veq:fpii)))
                       (f2!@.* (sqrt (abs (* 2f0 (log (rnd)))))
                               (cos u) (sin u)))))
     (veq:xlet ((f2!ab (-norm)) (c (-norm)))
       (f3!@*. ab c (/ r (veq:f3len ab c))))))
(veq:fvdef 3on-sphere (&optional (r 1f0))
  (declare (optimize speed (safety 0)) (veq:ff r))
  "random point on sphere with rad r. centered at origin."
  (veq:xlet ((f!th (* veq:fpii (rnd:rnd)))
             (f!la (- (the veq:ff (acos (- (* 2.0 (rnd:rnd)) 1f0))) veq:fpi5))
             (f!co (* r (cos la))))
    (values (* co (cos th)) (* co (sin th)) (* r (sin la)))))


(veq:fvdef 3in-sphere (&optional (r 1f0))
  (declare (optimize speed (safety 0)) (veq:ff r))
  "random point in sphere with rad r. centered at origin."
  (veq:xlet ((f3!cand (veq:f3val 0f0)))
    (loop while t do (setf (veq:f3 cand) (veq:f3rep (rnd*)))
                     (when (< (veq:f3len2 cand) 1f0)
                       (return-from 3in-sphere (f3!@*. cand r))))))
(veq:fvdef 3non-sphere (n &optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  "n random points on sphere with rad r. centered at origin."
  (f3!@$+! (veq:f3$zero n) (?@ (3on-sphere r))))
(veq:fvdef 3nin-sphere (n &optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  "n random points in sphere with rad r. centered at origin."
  (f3!@$+! (veq:f3$zero n) (?@ (3in-sphere r))))

