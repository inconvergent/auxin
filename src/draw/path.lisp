
(in-package :pth)

; TODO: fix printer
(defun oprt (o &optional s)
  ; (notinline )
  (format s "<@pth: (~a~:[o~;c~];  n: ~a, len: ~a)>"
          (@dim o) (@closed o) (@n o) (@len o)))

(defstruct (pth (:print-object oprt))
  (n 2 :type veq:pn :read-only t) ; number of points
  (ns 1 :type veq:pn :read-only t) ; number of segments
  (dim 2 :type veq:pn :read-only t)
  (closed nil :type boolean :read-only t)
  (vpts nil :type veq:fvec :read-only t) ; internal pts
  (ws nil :type veq:fvec :read-only t) ; intern agg weights
  (len 0f0 :type veq:ff :read-only t)) ; total length

(defun @dim (pth) (declare (pth pth)) (pth-dim pth))
(defun @n (pth) (declare (pth pth)) (pth-n pth))
(defun @ns (pth) (declare (pth pth)) (pth-ns pth))
(defun @closed (pth) (declare (pth pth)) (pth-closed pth))
(defun @len (pth) (declare (pth pth)) "the total length of pth" (pth-len pth))

(veq:fvdef prt (pth &optional (n (pth-n pth)))
  (declare (pth pth))
  (veq:$print (@pts pth) :dim (pth-dim pth))
  pth)

(veq:fvdef cpy (from* to* fi ti n &key (ffx #'identity) (tfx #'identity))
  (declare (veq:fvec from* to*) (veq:pn fi ti n) (function ffx tfx))
  (loop for f from fi for t* from ti repeat n
        do (setf (aref to* (f@tfx t*))
                 (aref from* (f@ffx f))))
  to*)

(defun init-cpy (dim closed pts)
  (if closed (veq:xlet ((p!l (length pts)))
               (cpy pts (cpy pts (veq:f$zero (+ dim l)) 0 0 l) 0 l dim))
             (veq:f$copy pts)))

(defun make-weights (dim ns vpts)
  (veq:xlet ((ws (veq:f$zero (1+ ns)))
             (f!tot 0f0))
    (labels ((segweight2 (i)
               (loop for j from i repeat dim
                     summing (expt (- (aref vpts (+ dim j))
                                      (aref vpts j)) 2f0)
                     of-type veq:ff)))
     (loop for i from 0 by dim repeat ns for j from 1
           for w = (sqrt (segweight2 i))
           do (setf (aref ws j) w)
              (incf tot w)))
    (loop with agg = 0f0
          for i from 0 repeat ns
          for c = (/ (aref ws i) tot)
          do (incf agg c) (setf (aref ws i) agg))
    ; override last value to 1 in case floats do not sum to 1
    (setf (aref ws ns) 1f0)
    (values ws tot)))

(defun get-n (dim pts &aux (n (floor (/ (length pts) dim))))
  (when (< n 1) (error "PTH: not enough points in ~a, for dim: ~a" pts dim))
  n)

(defun make (pts &key (dim 2) closed)
  (declare (veq:fvec pts) (veq:pn dim) (boolean closed))
  "initiate a pth from pts"
  (veq:xlet ((p!n (get-n dim pts))
             (p!ns (if closed n (1- n)))
             (vpts (init-cpy dim closed pts)))
   (veq:mvb (ws len) (make-weights dim ns vpts)
     (make-pth :dim dim :n n :ns ns :closed closed :vpts vpts :ws ws :len len))))

; TODO: handle wrap around?
(defun find-seg (ws ns a)
  (loop for i from 1 repeat ns
        if (<= a (aref ws i))
        do (return-from find-seg (1- i)))
  (1- ns))

(declaim (inline dimlerp))
(defun dimlerp (dim ns ws vpts a)
  (declare #.*opt* (veq:pn dim ns) (veq:fvec vpts ws) (veq:ff a))
  (veq:xlet ((p!seg (find-seg ws ns a))
             (f!wlft (aref ws seg))
             (f!lerp (/ (- a wlft) (- (aref ws (1+ seg)) wlft)))
             (res (veq:f$zero dim)))
   (declare (veq:fvec res))
   (loop for i from (* dim seg) for j from 0 repeat dim
         do (setf (aref res j)
                  (the veq:ff (+ (aref vpts i) (* lerp (- (aref vpts (+ i dim))
                                                          (aref vpts i)))))))
   (values res seg lerp)))

(defun @pts (pth &optional closed)
  (declare (pth pth) (boolean closed))
  "returns all points in pth"
  (veq:xlet ((p!dim (pth-dim pth))
             (p!n (* (pth-n pth) dim))
             (res (veq:f$zero (if closed (+ n dim) n))))
    (when closed (cpy (pth-vpts pth) res 0 n dim))
    (cpy (pth-vpts pth) res 0 0 n)))

(defun pos (pth &optional (a 0f0))
  (declare (pth pth) (veq:ff a))
  "get the coordinate of the linear interpolation along pth where 0.0 <= a <= 1.0.
if pth is closed (pos a) equals (pos b)."
  (with-struct (pth- dim ns ws vpts) pth (dimlerp dim ns ws vpts a)))

(defun lpos (pth a b)
  (declare (pth pth) (veq:ff a b))
  "get all points [(pos a) ... (pos b)].
if pth is closed and b < a it will move through (pos 0)"
  (with-struct (pth- dim ns ws closed vpts) pth
    (labels
      ((init (a b r)
         (declare (veq:ff a b) (veq:pn r))
         (cpy (dimlerp dim ns ws vpts b)
           (cpy (dimlerp dim ns ws vpts a)
                (veq:f$zero (* dim (+ 2 r))) 0 0 dim)
           0 (* dim (1+ r)) dim))

       (do-a<b (a b)
         (declare (veq:ff a b))
         (veq:xlet ((p!aseg (find-seg ws ns a))
                    (p!r (- (find-seg ws ns b) aseg)))
           (cpy vpts (init a b r) (* dim (1+ aseg)) dim (* dim r))))

       (do-a>b (a b)
         (declare (veq:ff a b))
         (veq:xlet ((p!aseg (find-seg ws ns a))
                    (p!r (+ ns (- (find-seg ws ns b) aseg)))
                    (p!mm (* dim ns)))
           (cpy vpts (init a b r) (* dim (1+ aseg)) dim (* dim r)
                :ffx (lambda (m) (mod m mm))))))

        ; this probably isn't very stable. use *eps*?
        (cond ((< a b) (do-a<b a b))
              ((and closed (> a b)) (cond ((>= a #.(- 1f0 veq:*eps*)) (do-a<b 0f0 b))
                                          ((<= b #.veq:*eps*) (do-a<b a 1f0))
                                          (t (do-a>b a b))))
              (t (error "PTH: must have a<b, or closed path with b<a.
got a: ~a, b: ~a, closed: ~a" a b closed))))))

