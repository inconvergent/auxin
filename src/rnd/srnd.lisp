
(in-package :srnd)


(declaim (inline -srnd make srnd do-rnd))
(defstruct (srnd (:constructor -srnd (s)))
  (s 0 :type veq:pn :read-only nil))
(defun make (rs*)
  (declare #.*srndopt* (fixnum rs*))
  "make stateful rnd generator state, rs"
  (-srnd (mod (abs rs*) 2147483647)))
(defun srnd (rs) (declare #.*srndopt* (fixnum rs)) "see make" (make rs))

(defun do-rnd (rs)
  (declare #.*srndopt* (srnd rs))
  (setf (srnd-s rs) (the veq:pn (rem (the fixnum (* 16807 (srnd-s rs))) 2147483647)))
  (/ (veq:ff (srnd-s rs)) #.(veq:ff 2147483647)))

(declaim (inline 1rnd rrnd))
(defun 1rnd (rs)
  (declare #.*srndopt* (srnd rs))
  (the veq:ff (abs (the veq:ff (do-rnd rs)))))
(defun rrnd (rs r)
  (declare #.*srndopt* (srnd rs) (veq:ff r))
  (the veq:ff (the veq:ff (* (the veq:ff r) (1rnd rs)))))
(defmacro rnd (rs &optional r)
   (declare (symbol rs))
  "get a random float [0.0 1.0] from state rs (scaled by r)"
   (if r `(rrnd ,rs ,r) `(1rnd ,rs)))

(declaim (inline 1rad rrad))
(defun 1rad (rs)
   (declare #.*srndopt* (srnd rs))
   (- 1f0 (* 2.0 (rnd rs))))
(defun rrad (rs r)
   (declare #.*srndopt* (srnd rs) (veq:ff r))
   (* r (1rad rs)))
(defmacro rnd* (rs &optional r)
   (declare (symbol rs))
   "get a random float in range [-r r] from state rs. r defaults to 1.0"
   (if r `(rrad ,rs ,r) `(1rad ,rs)))

(defmacro rndrng (rs a b &aux (a* (gensym)))
  (declare (symbol rs))
  "get a random number in range [a b] from state rs"
  (cond ((and (numberp a) (numberp b)) `(+ ,a (rnd ,rs ,(- b a))))
        ((numberp a) `(+ ,a (rnd ,rs (- ,b ,a))))
        (t `(let ((,a* ,a))
              (declare (veq:ff ,a*))
              (+ ,a* (rnd ,rs (- ,b ,a*)))))))

(declaim (inline 3in-sphere 3on-sphere))
(veq:fvdef 3in-sphere (rs r)
  (declare #.*srndopt* (srnd rs) (veq:ff r))
  "get random point in sphere with rad r from state rs. centered at origin."
  (veq:f3let ((cand (veq:f3val 0f0)))
    (loop while t do (setf (veq:f3 cand) (veq:f3rep (1rad rs)))
                     (when (< (veq:f3len2 cand) 1f0)
                           (return-from 3in-sphere (f3!@*. cand r))))))
(veq:fvdef 3on-sphere (rs r)
  (declare #.*srndopt* (srnd rs) (veq:ff r))
  "get random point on sphere with rad r from state rs. centered at origin."
  (veq:fvlet ((th (rnd rs #.veq:fpii))
              (la (- (the veq:ff (acos (- (rnd rs 2.0) 1f0))) veq:fpi5))
              (co (* r (cos la))))
    (values (* co (cos th)) (* co (sin th)) (* r (sin la)))))

(declaim (inline 2in-circ 2on-circ))
(veq:fvdef 2in-circ (rs r)
  (declare #.*srndopt* (srnd rs) (veq:ff r))
  "random point in circle with rad r from state rs. centered at origin."
  (veq:fvlet ((a (1rnd rs)) (b (1rnd rs)))
    (if (< a b) (setf a (* veq:fpii (/ a b)) b (* b r))
                (let ((d a)) (declare (veq:ff d))
                             (setf a (* veq:fpii (/ b a)) b (* d r))))
    (values (* (cos a) b) (* (sin a) b))))
(veq:fvdef 2on-circ (rs r)
  (declare #.*srndopt* (srnd rs) (veq:ff r))
  "get random point on circle with rad r from state rs. centered at origin."
  (f2!@*. (veq:fcos-sin (* #.veq:fpii (rnd rs))) r))

