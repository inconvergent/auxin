(in-package #:auxin)

(declaim (inline lst>n last* vector-last vector-first))

(deftype small-ind (&optional (size 30000)) `(integer 0 ,size))

(defun d? (f) (describe f)) (defun i? (f) (inspect f))
(defun v? (&optional (silent t) &aux (v (slot-value (asdf:find-system 'auxin) 'asdf:version)))
  (unless silent (format t "~%veq version: ~a~%" v))
  v)

(defun cmd-args () ;http://cl-cookbook.sourceforge.net/os.html
  (or #+SBCL sb-ext:*posix-argv* #+LISPWORKS system:*line-arguments-list*
      #+CMU extensions:*command-line-words* nil))

(defun terminate (status &optional silent) ;https://www.rosettacode.org/wiki/Program_termination#Common_Lisp
  (unless silent (format t "~%terminated with status: ~a~%" status))
  #+sbcl (sb-ext:quit :unix-status status) #+ccl (ccl:quit status)
  #+clisp (ext:quit status) #+cmu (unix:unix-exit status)
  #+abcl (ext:quit:status status) #+allegro (excl:exit status :quiet t)
  #+gcl (common-lisp-user::bye status) #+ecl (ext:quit status))

;https://github.com/inconvergent/weir/pull/1/commits/4a1df51914800c78cb34e8194222185ebde12388
(defmacro define-struct-load-form (struct-name)
  "allow struct to be dumped to fasl files."
  `(defmethod make-load-form ((obj ,struct-name) &optional env)
     (make-load-form-saving-slots obj :environment env)))

(defun mkstr (&rest args)
  (with-output-to-string (s) (dolist (a args) (princ a s))))
(defun reread (&rest args) (values (read-from-string (apply #'mkstr args))))

(defun last* (a) (first (last a)))
(defun lst>n (l n)
  (declare (list l) (veq:pn n)) "is list, l, longer than n?"
  (consp (nthcdr n l)))

(defun symb (&rest args) (values (intern (apply #'mkstr args))))
;https://gist.github.com/lispm/6ed292af4118077b140df5d1012ca646
(defun psymb (package &rest args) (values (intern (apply #'mkstr args) package)))
(defun kv (&rest args) (values (intern (apply #'mkstr args) "KEYWORD")))

;https://gist.github.com/lispm/6ed292af4118077b140df5d1012ca646
(defmacro with-struct ((name . fields) struct &body body)
  (let ((gs (gensym)))
    `(let ((,gs ,struct))
       (let ,(mapcar #'(lambda (f)
                         `(,f (,(psymb (symbol-package name) name f) ,gs)))
                     fields)
         ,@body))))

(defun -gensyms (name n)
  (declare (symbol name) (fixnum n))
  (loop with name = (string-upcase (string name))
        for x across "XYZWUVPQR" repeat n
        collect (gensym (format nil "~a-~a-" name x))))

(defmacro make-animation ((ani) &body body)
  `(push (lambda () (progn ,@body)) ,ani))
(defmacro animate (ani)
  (awg (a) `(setf ,ani (remove-if-not (lambda (,a) (funcall ,a)) ,ani))))

(defmacro psh (a l)
  (declare (symbol l)) "push a to l, return a. a is evaluated only once."
  (awg (a*) `(let ((,a* ,a)) (push ,a* ,l) ,a*)))

(defun split (s c)
  (declare (string s)) "split s at c"
  (veq::split-string (etypecase c (string (char c 0)) (character c)) s))

(defun -docs-sanitize (d) ; why is this here?
  (let ((sp (veq::split-string #\~ d)))
    (apply #'veq::mkstr
      (concatenate 'list (mapcar (lambda (s)
                                  (veq::mkstr s #\~ #\~)) (butlast sp))
                   (last sp)))))

(defun append-number (fn i)
  (declare (string fn) (fixnum i)) "append number i to fn with zero padding."
  (format nil "~a-~8,'0d" fn i))

; https://stackoverflow.com/questions/20963313/how-do-i-trim-leading-and-trailing-whitespace-in-common-lisp
(defun trim (s) ; TODO: improve this
  (declare (string s))
  (string-trim '(#\Space #\Newline #\Backspace #\Tab
                 #\Linefeed #\Page #\Return #\Rubout)
               s))

(defun ensure-filename (fn &optional (postfix "") (silent nil))
  (let ((fn* (mkstr (if fn fn "tmp") postfix)))
    (declare (string fn*))
    (format (not silent) "~&file: ~a~&" fn*)
    fn*))

(defun print-every (i &optional (n 1))
  (declare (fixnum i n))
  (when (zerop (mod i n)) (format t "~&itt: ~a~&" i)))

(defun string-list-concat (l) (declare (list l)) (format nil "~{~a~}" l))

(defun numshow (a &key (ten 6) (prec 6))
  (declare (number a))
  (let ((show (format nil "~~,~af" prec)))
    (if (< 1d-6 (the number (abs a)) (expt 10 ten))
        (format nil show a)
        (format nil "~,1e" a))))

(abbrev vextend vector-push-extend)
(defun lvextend (x v)
  (declare (sequence x) (vector v)) "extend v with all items in x."
  (typecase x (cons (loop for o in x do (vextend o v)))
              (t (loop for o across x do (vextend o v)))))

(defun vector-last (a) (declare (vector a)) (aref a (1- (length a))))
(defun vector-first (a) (declare (vector a)) (aref a 0))
; move to veq?
(abbrev vl vector-last) (abbrev tl to-list)
(abbrev tv to-vector)   (abbrev ev ensure-vector)
(abbrev tav to-adjustable-vector)

(defun make-adjustable-vector (&key init (type t) (size 128))
  (if init (make-array (length init)
             :fill-pointer t :initial-contents init
             :element-type type :adjustable t)
           (make-array size
             :fill-pointer 0 :element-type type :adjustable t)))

(defun to-list (a) (declare (sequence a)) (coerce a 'list))
(defun to-vector (init &key (type t))
  (declare (list init))
  (make-array (length init)
    :initial-contents init :adjustable nil :element-type type))
(defun ensure-vector (o &key (type t))
  (declare (sequence o))
  (etypecase o (cons (to-vector o :type type)) (vector o)))
(defun to-adjustable-vector (init &key (type t))
  (declare (sequence init))
  (make-array (length init) :fill-pointer t :initial-contents init
                            :element-type type :adjustable t))
(defun undup (e)
  (declare (optimize speed))
  "remove duplicates w/out side-effects. (wraps delete-duplicates)"
  (delete-duplicates (awf e)))

(defun internal-path-string (path &optional (pkg :auxin))
  (declare (string path))
  "get full path to file inside pkg."
  (namestring (asdf:system-relative-pathname pkg path)))

(defun show-ht (ht) ; TODO: this is probably not very general
  (typecase ht
    (hash-table (when (< (hash-table-count ht) 1) (format t "~& { empty~%"))
                (loop for k being the hash-keys of ht using (hash-value v)
                      for i from 0 do (format t "~& { ~d: ~a: ~@{~a~^ ~}~&" i k v)))
    (t (warn "~& { nil")))
  ht)

(defmacro with-fast-stack ((sym &key (type 'fixnum) (n 1000) (v 0) (safe-z 100))
                                &rest body)
  (declare (symbol sym) (veq:pn n safe-z))
  (awg (mem ind)
    `(let ((,ind ,safe-z)
           (,mem (make-array ,(+ n (* 2 safe-z))
                   :element-type ',type :initial-element ,v)))
       (declare (type (simple-array ,type) ,mem) (small-ind ,ind))
       (macrolet ((,(symb 'push- sym) (val) ; add this element to the stack
                    `(progn (setf (aref ,',mem ,',ind) ,val)
                            (setf ,',ind (the small-ind (1+ ,',ind)))))
                  (,(symb 'pop- sym) () ; pop the next element
                    `(progn (setf ,',ind (the small-ind (1- ,',ind)))
                            (aref ,',mem ,',ind)))
                  (,(symb 'ind- sym) () ',ind) ; current stack index
                  (,(symb 'peek- sym) () `(aref ,',mem (1- ,',ind))) ; next element in stack
                  (,(symb 'nil- sym) () ; reset stack index to safe-z (zero)
                    `(progn (setf ,',ind (the small-ind ,,safe-z))))
                  (,(symb 'con- sym) () `(< (the small-ind ,,safe-z) ,',ind)) ; is the stack empty?
                  (,(symb 'stack- sym) () ; check state
                    `(progn (when (< ,',ind (the small-ind ,,safe-z))
                                  (error "stack underflow in: ~a. ind: ~a" ',',sym ,',ind))
                            (when (< ,,(the small-ind (- n safe-z)) ,',ind)
                                  (error "stack overflow in: ~a. ind: ~a" ',',sym ,',ind)))))
         ,@body))))

(defmacro gi (v) `(* (veq:ff ,v) #.(/ 1f9)))
(defmacro me (v) `(* (veq:ff ,v) #.(/ 1f6)))
(defmacro ki (v) `(* (veq:ff ,v) #.(/ 1f3)))

(defun now (&optional (t0 0.0))
  (declare (optimize speed) (veq:ff t0))
  (abs (- (* (veq:ff (get-internal-real-time))
             #.(veq:ff (/ internal-time-units-per-second)))
          t0)))
(defun mmss (i)
  (declare (veq:ff i))
  (let ((ms (format nil "~2,1f" (nth-value 1 (truncate i)))))
   (format nil "~03d:~2,'0d~a"
     (floor (/ i 60)) (mod (floor i) 60)
     (lqn:tail ms 2))))

(defun wheel (s)
  (declare (veq:ff s))
  (cond ((< s #.(/ 1.1 10.0)) " ")
        ((< s #.(/ 2.1 10.0)) "◦")
        ((< s #.(/ 3.1 10.0)) "○")
        ((< s #.(/ 4.1 10.0)) "◔")
        ((< s #.(/ 5.1 10.0)) "◑")
        ((< s #.(/ 6.1 10.0)) "◕")
        ((< s #.(/ 7.1 10.0)) "❉")
        ((< s #.(/ 8.1 10.0)) "✱")
        ((< s #.(/ 9.1 10.0)) "◉")
        (t                    "●")))

(veq:fvdef iter-timer (tot &key (int 1) (s t)
                                (prefx (lambda (&rest rest) ""))
                                (infofx (lambda (&rest rest)
                                          (declare (ignorable rest)) "")))
  (declare #.*opt* (veq:pn tot int) (function infofx))
  (veq:xlet ((t0 (now)) (p!i 0) (f!last 0f0))
    (labels ((timer (&optional silent &aux (progr (now t0)) (r (veq:ff (veq:ff (/ i (veq:ff tot))))))
               (cond ((and (> i 0) (zerop (mod i int)))
                      (progn
                        (unless silent
                          (format s "██ ~a ~a█ ~4@<~d~>|~a █ ~a  [Δ~a; ↓~a] ██ ~a~%"
                                  (lqn:seq (lqn:now) 11 19) (f@prefx) i
                                  (lqn:tail (lqn:fmt "~05,3f" r) 3)
                                  (mmss progr) (mmss (abs (- last progr)))
                                  (mmss (- (* tot (/ progr i)) progr))
                                  (f@infofx i progr (abs (- progr last ))))
                          (finish-output))
                        (setf last progr))))
               (incf i)
               (values i progr)))
      #'timer)))

