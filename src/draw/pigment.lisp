
(in-package :pigment)

"""pigments are stored internally with pre-multiplied alpha."""


(defmacro with ((c r g b a) &body body)
  "pre-multiplied (values ra ga ba a). ex: (with (pigment r g b a) (list r g b a))."
  (auxin:awg (c*)
    `(let* ((,c* ,c) (,r (rgba-r ,c*)) (,g (rgba-g ,c*))
                     (,b (rgba-b ,c*)) (,a (rgba-a ,c*)))
      (declare (veq:ff ,r ,g ,b ,a))
      (progn ,@body))))
(defmacro with* ((c r g b a) &body body)
  "(values r g b a). ex: (with (pigment r g b a) (list r g b a))."
  (auxin:awg (c*)
    `(let* ((,c* ,c) (,a (rgba-a ,c*)) (,r (/ (rgba-r ,c*) ,a))
                     (,g (/ (rgba-g ,c*) ,a)) (,b (/ (rgba-b ,c*) ,a)))
      (declare (veq:ff ,r ,g ,b ,a))
      (progn ,@body))))

(defun -print-rgba (c s)
  (declare (notinline rgba-r rgba-g rgba-b rgba-a))
  (with* (c r g b a) (format s "~&<@rgba: (r: ~f, g: ~a, b: ~a, a: ~a)>~&" r g b a)))

(defstruct (rgba (:constructor make-rgba) (:constructor -make-rgba (r g b a))
                 (:print-object -print-rgba))
  (r 0f0 :type veq:ff :read-only nil) (g 0f0 :type veq:ff :read-only nil)
  (b 0f0 :type veq:ff :read-only nil) (a 1f0 :type veq:ff :read-only nil))

(auxin:define-struct-load-form rgba)
#+SBCL(declaim (sb-ext:freeze-type rgba))

(veq:fvdef make (r g b &optional (a 1f0))
  (declare #.*opt* (veq:ff r g b a))
  "make a pigment instance (r g b a). all values should range be [0 1].
stored internally with pre-multiplied alpha."
  (f4_@-make-rgba (f3!@*. r g b a) a))
(veq:fvdef rgb ((:va 3 rgb) &optional (a 1f0)) (declare #.*opt* (veq:ff rgb a)) "same as make." (make rgb a))
(defun copy (c)
  (declare #.*opt* (rgba c))
  "copy a pigment"
  (-make-rgba (rgba-r c) (rgba-g c) (rgba-b c) (rgba-a c)))

(veq:fvdef scale (c s)
  (declare #.*opt* (rgba c) (veq:ff s))
  "scale by s. scales with alpha value.
note: this trival scale of pre-multiplied values."
  (with (c r g b a) (f4_@-make-rgba (f4!@*. r g b a s))))
(defun scale! (c s)
  (declare #.*opt* (rgba c) (veq:ff s))
  "scale by s in place."
  (with (c r g b a) (setf (rgba-r c) (* r s) (rgba-g c) (* g s)
                          (rgba-b c) (* b s) (rgba-a c) (* a s)))
  c)

(defun as-val (c) (declare #.*opt* (rgba c)) "as values, pre-multiplied" (with (c r g b a) (values r g b a)))
(defun as-val* (c) (declare #.*opt* (rgba c)) "as values" (with* (c r g b a) (values r g b a)))
(defun as-list (c)
  (declare #.*opt* (rgba c))
  "return list with (r g b a), (r g b) is pre multiplied"
  (with (c r g b a) (list r g b a)))
(defun as-list* (c) (declare #.*opt* (rgba c)) "return (r g b a)" (with* (c r g b a) (list r g b a)))

(veq:fvdef cmyk ((:va 3 cmy) k &optional (a 1f0))
  (declare #.*opt* (veq:ff cmy k a))
  "create pigment from (c m y k a). a is optional."
  (f4_@make (f3!@*. (f4!@.- 1f0 cmy k) (- 1f0 k)) a))

(veq:fvdef hsv (h s v &optional (a 1f0))
  (declare #.*opt* (veq:ff h s v a))
  "create pigment from (h s v a). a is optional."
  (veq:xlet ((f!c (* v s))
             (f!x (* c (- 1f0 (abs (- (mod (* 6f0 h) 2f0) 1f0)))))
             (f!m (- v c)))
    (f4_@make (case (the fixnum (floor (mod (* h 6f0) 6f0)))
                (0 (veq:f3 (+ c m) (+ x m) m)) (1 (veq:f3 (+ x m) (+ c m) m))
                (2 (veq:f3 m (+ c m) (+ x m))) (3 (veq:f3 m (+ x m) (+ c m)))
                (4 (veq:f3 (+ x m) m (+ c m))) (5 (veq:f3 (+ c m) m (+ x m)))
                (t (veq:f3val 0f0)))
              a)))

; TODO: return values?
(veq:fvdef as-hsv (c)
  (declare #.*opt* (rgba c))
  "return pigment as (list h s v a)"
  (labels ((-mod (ca cb df p)
             (declare #.*opt* (veq:ff ca cb df p))
             (nth-value 1 (floor (+ p (* #.(/ 6f0) (/ (the veq:ff (- ca cb)) df)))))))
    (with* (c r g b a)
      (let ((rgb (list r g b)))
        (declare (list rgb))
        (auxin:mvb (imn mn) (math:argmin rgb) ; TODO: vargmin, values argmin
          (declare (veq:pn imn) (veq:ff mn))
          (auxin:mvb (imx mx) (math:argmax rgb)
            (declare (veq:pn imx) (veq:ff mx))
            (veq:xlet ((f!df (- mx mn)))
              (list (cond ((= imn imx) 0f0) ; h
                          ((= imx 0) (-mod g b df 1f0))
                          ((= imx 1) (-mod b r df #.(/ 3f0)))
                          ((= imx 2) (-mod r g df #.(/ 2f0 3f0))))
                    (if (<= mx 0f0) 0f0 (/ df mx)) ; s
                    mx a)))))))) ; v a
(defun as-hex (c)
  (declare #.*opt* (rgba c))
  "(values #rrggbb a)"
  (labels ((-hex (d)
             (declare #.*opt* (veq:ff d))
             (min 255 (max 0 (floor (veq:ff (* d 256)))))))
    (with* (c r g b a) (values (format nil "#~@{~2,'0x~}" (-hex r) (-hex g) (-hex b))
                               a))))

; --------- COLORS
(defun black (&optional (a 1f0)) (declare #.*opt* (veq:ff a)) "black" (make 0f0 0f0 0f0 a))
(defun blue (&optional (a 1f0)) (declare #.*opt* (veq:ff a)) "blue" (make 0f0 0f0 1f0 a))
(defun dark (&optional (a 1f0)) (declare #.*opt* (veq:ff a)) "0.2 gray" (make 0.2f0 0.2f0 0.2f0 a))
(defun gray (&optional (v 0.5) (a 1f0)) (declare #.*opt* (veq:ff v a)) "v gray" (make v v v a))
(defun green (&optional (a 1f0)) (declare #.*opt* (veq:ff a)) "green" (make 0f0 1f0 0f0 a))
(defun mdark (&optional (a 1f0)) (declare #.*opt* (veq:ff a)) "0.3 gray" (make 0.3f0 0.3f0 0.3f0 a))
(defun red (&optional (a 1f0)) (declare #.*opt* (veq:ff a)) "red" (make 1f0 0f0 0f0 a))
(defun transparent (&optional (a 0f0)) (declare #.*opt* (veq:ff a)) "transparent." (-make-rgba 0f0 0f0 0f0 a))
(defun vdark (&optional (a 1f0)) (declare #.*opt* (veq:ff a)) "0.1" (make 0.1f0 0.1f0 0.1f0 a))
(defun white (&optional (a 1f0)) (declare #.*opt* (veq:ff a)) "white" (make 1f0 1f0 1f0 a))

(defun cyan (&key (sat 1f0) (val 1f0) (alpha 1f0)) "cyan with s, v, a" (hsv #.(/ 180f0 360f0) sat val alpha))
(defun magenta (&key (sat 1f0) (val 1f0) (alpha 1f0)) "magenta with s, v, a" (hsv #.(/ 300f0 360f0) sat val alpha))
(defun yellow (&key (sat 1f0) (val 1f0) (alpha 1f0)) "yellow with s, v, a" (hsv #.(/ 60.0 360f0) sat val alpha))

