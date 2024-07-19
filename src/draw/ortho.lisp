
(in-package :ortho)

"
Simple orthographic projection with camera position (cam), view vector (vpn)
view plane offset (xy) and scaling (s).
"

(declaim (inline 3identity zero))
(veq:fvdef 3identity ((:va 3 x)) (values x))
(veq:fvdef zero () (veq:f3$point 0f0 0f0 0f0))


(defstruct (ortho)
  (vpn (zero) :type veq:fvec :read-only nil) ; away from dop
  (up (zero) :type veq:fvec :read-only nil) ; cam up
  (cam (zero) :type veq:fvec :read-only nil) ; cam position
  (u (zero) :type veq:fvec :read-only nil) ; view plane horizontal
  (v (zero) :type veq:fvec :read-only nil) ; view plane vertical
  (su (zero) :type veq:fvec :read-only nil) ; u scaled by s
  (sv (zero) :type veq:fvec :read-only nil) ; v scaled by s
  (xy (veq:f2$point 0f0 0f0) :type veq:fvec :read-only nil) ; view plane offset
  (s 1f0 :type veq:ff :read-only nil) ; scale
  (raylen 5000f0 :type veq:ff :read-only nil)
  (projfx #'3identity :type function :read-only nil)
  (dstfx #'3identity :type function :read-only nil)
  (rayfx #'3identity :type function :read-only nil))

(declaim (inline @cam @s @up @vpn @xy))
(veq:fvdef @cam (proj) (veq:f3$s proj ortho- :cam))
(veq:fvdef @s (proj) (ortho-s proj))
(veq:fvdef @up (proj) (veq:f3$s proj ortho- :up))
(veq:fvdef @vpn (proj) (veq:f3$s proj ortho- :vpn))
(veq:fvdef @xy (proj) (veq:f2$s proj ortho- :xy))


(veq:fvdef -get-u-v (up* vpn* &optional (s 1f0))
  (declare #.*opt* (veq:fvec up* vpn*) (veq:ff s))
  (veq:f3let ((up (veq:f3$ up*))
              (vpn (veq:f3$ vpn*)))

    (unless (< (abs (veq:f3dot up vpn)) #.(- 1f0 veq:*eps*))
            (error "ortho: gimbal lock.~%up: ~a~%vpn: ~a" up* vpn*))

    (veq:f3let ((v (veq:f3norm (f3.@- (veq:f3from up vpn (- (veq:f3dot up vpn))))))
                (u (veq:f3rot v vpn veq:fpi5)))
      (veq:~ u v (f3!@*. u s) (f3!@*. v s)))))

(veq:fvdef -look (cam look)
  (declare #.*opt* (veq:fvec cam look))
  (veq:f3$point (veq:f3norm (f3!@- (veq:f3$ cam) (veq:f3$ look)))))

(veq:fvdef make-dstfx (proj)
  (declare #.*opt*)
  "distance from pt to camera plane with current parameters"
  (veq:f3let ((cam (@cam proj))
              (vpn (@vpn proj)))
    (lambda ((:va 3 pt)) (declare (veq:ff pt))
      (auxin:mvb (hit d) (veq:f3planex vpn cam pt (f3!@+ pt vpn))
        (declare (boolean hit) (veq:ff d))
        (if hit d 0f0)))))

(veq:fvdef make-projfx (proj)
  (declare #.*opt*)
  "function to project pt into 2d with current parameters"
  (veq:f3let ((su (veq:f3$s proj ortho- :su))
              (sv (veq:f3$s proj ortho- :sv))
              (cam (@cam proj)))
    (auxin:mvb (x y) (@xy proj)
      (declare (veq:ff x y))
      (lambda ((:va 3 pt))
        (declare #.*opt* (veq:ff pt))
        (veq:f3let ((pt* (f3!@- pt cam)))
          (veq:f2 (+ x (veq:f3dot su pt*)) (+ y (veq:f3dot sv pt*))))))))

(veq:fvdef make-rayfx (proj)
  (declare #.*opt* (ortho proj))
  "cast a ray in direction -vpn from pt"
  (veq:f3let ((dir (f3!@*. (f3.@- (@vpn proj))
                           (ortho-raylen proj))))
    (lambda ((:va 3 pt))
      (declare #.*opt* (veq:ff pt))
      (veq:~ pt (f3!@+ pt dir)))))

(veq:fvdef make (&key (up (veq:f3$point 0f0 0f0 1f0))
                      (cam (veq:f3$point 1000f0 1000f0 1000f0))
                      (xy (veq:f2$point 500f0 500f0))
                      (s 1f0) vpn look (raylen 5000f0))
  (declare (veq:fvec up cam xy) (veq:ff s raylen))
  "
  make projection.

  default up is (0 0 1)
  default cam is (1000 1000 1000)
  if look and vpn are unset, the camera will look at the origin.

  default scale is 1
  default xy is (0 0)
  "

  (assert (not (and vpn look)) (vpn look)
          "make: can only use (or vpn look)." vpn look)

  (let* ((look (if look look (veq:f3$point 0f0 0f0 0f0)))
         (vpn* (if vpn vpn (-look cam look))))
    (auxin:mvb ((:va 3 u v su sv)) (-get-u-v up vpn* s)
      (declare (veq:ff u v su sv))
      (let ((res (make-ortho :vpn vpn* :up up :cam cam :s s :xy xy :raylen raylen
                             :u (veq:f3$point u)   :v (veq:f3$point v)
                             :su (veq:f3$point su) :sv (veq:f3$point sv))))
        (setf (ortho-dstfx res) (make-dstfx res)
              (ortho-projfx res) (make-projfx res)
              (ortho-rayfx res) (make-rayfx res))
        res))))


(veq:fvdef update (proj &key s xy up cam vpn look)
  "
  update projection parameters.

  use vpn to set view plane normal directly, or look to set view plane normal
  relative to camera.

  ensures that internal state is updated appropriately.
  "
  (declare #.*opt* (ortho proj))

  (assert (not (and vpn look)) (vpn look)
          "update: can only use (or vpn look)." vpn look)

  (when cam (setf (ortho-cam proj) cam))
  (when up (setf (ortho-up proj) up))
  (when vpn (setf (ortho-vpn proj) vpn))
  (when look (setf (ortho-vpn proj) (-look (ortho-cam proj) look)))
  (when s (setf (ortho-s proj) (the veq:ff s)))
  (when xy (setf (ortho-xy proj) xy))
  ; TODO: there appears to be a bug where u,v is not updated if cam is changed??
  (when (or cam s up vpn look)
        (auxin:mvb ((:va 3 u v su sv))
                   (-get-u-v (ortho-up proj) (ortho-vpn proj) (ortho-s proj))
          (declare (veq:ff u v su sv))
          (setf (veq:3$ (ortho-u proj)) (values u)
                (veq:3$ (ortho-v proj)) (values v)
                (veq:3$ (ortho-su proj)) (values su)
                (veq:3$ (ortho-sv proj)) (values sv))))

  (setf (ortho-dstfx proj) (make-dstfx proj)
        (ortho-projfx proj) (make-projfx proj)
        (ortho-rayfx proj) (make-rayfx proj))
  proj)

(veq:fvdef around (c axis val &key (look (veq:f3$point (veq:f3rep 0f0))))
  (declare (ortho c) (keyword axis) (veq:ff val) (veq:fvec look))
  (unless (> (abs val) 0) (return-from around nil))
  (macrolet ((_ (&rest rest) `(veq:fvprogn (veq:f_ (veq:lst ,@rest))))
             (rot (a b) `(veq:fvprogn (veq:f3rots (veq:f3$s c ortho- ,a ,b val) 0f0 0f0 0f0))))
    (case axis
      (:pitch (veq:f3let ((pos (rot :cam :u))
                          (up (veq:f3norm (rot :up :u)))
                          (vpn (veq:f3norm (f3!@- pos (veq:f3$ look)))))
                (update c :cam (_ pos) :vpn (_ vpn) :up (_ up))))
      (:yaw (veq:f3let ((pos (rot :cam :v))
                        (up (veq:f3norm (rot :up :v)))
                        (vpn (veq:f3norm (f3!@- pos (veq:f3$ look)))))
                (update c :cam (_ pos) :vpn (_ vpn) :up (_ up))))
      (:roll (update c :up (veq:f3$point
                             (veq:f3rot (veq:f3$s c ortho- :up :vpn val))))))))

(veq:fvdef* vm (p (:va 3 look))
  (declare #.*opt* (ortho p) (veq:ff look)) "view matrix, compatible with gmsh/scene"
  (veq::m@fmake-view-matrix (veq:f3$ (ortho-cam p)) look
                            (veq:f3$ (ortho-up p))))

; TODO: / s is inconsistent/confusing
(veq:fvdef pm (p s &optional (near 0.1) (far 50f0) &aux (s (/ s)))
  (declare #.*opt* (ortho p) (veq:ff near far s)) "projection matrix. compatible with gmsh/scene"
  (veq:fmake-ortho-proj-matrix s s near far))

(veq:fvdef* project (proj (:va 3 pt))
  (declare #.*opt* (ortho proj) (veq:ff pt))
  "project single point. returns (values x y d)"
  (veq:~ (funcall (ortho-projfx proj) pt)
         (funcall (ortho-dstfx proj) pt)))

(veq:vdef project* (proj path)
  (declare #.*opt* (ortho proj) (veq:fvec path))
  "project a path #(x1 y1 z1 x2 y2 z2 ...).
   returns projected path and distances:
(values #(px1 py1 px2 py2 ...) #(d1 d2 ...))"
  (labels ((projfx ((:va 3 x)) (funcall (ortho-projfx proj) x))
           (dstfx ((:va 3 x)) (funcall (ortho-dstfx proj) x)))
    (values (f32_@$projfx path) (f31_@$dstfx path))))

(defun export-data (p)
  (declare (ortho p))
  "export the neccessary values to recreate ortho"
  (auxin:with-struct (ortho- vpn cam up s xy raylen) p
    `((:vpn . ,vpn) (:cam . ,cam) (:up . ,up)
      (:s . ,s) (:xy . ,xy) (:raylen . ,raylen))))

(defun import-data (p)
  (declare (list p))
  "recreate proj from an a list exported by ortho:export-data"
  (labels ((as (i a) (cdr (assoc i a)))
           (as-float (i a) (veq:ff (as i a)))
           (as-arr (i a) (veq:f_ (coerce (as i a) 'list))))
    (ortho:make :cam (as-arr :cam p) :vpn (as-arr :vpn p)
                :up (as-arr :up p) :xy (as-arr :xy p)
                :s (as-float :s p) :raylen (as-float :raylen p))))

