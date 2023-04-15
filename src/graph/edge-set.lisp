
(in-package :graph)

(defun -sort-edge (e)
  (sort e #'<))

(defun cycle->edge-set (cycle)
  (declare (list cycle))
  "return edge set from cycle.
ex: (1 2 3 4 5 1) -> ((1 2) (2 3) (3 4) (4 5) (1 5))"
  (loop for a in cycle and b in (cdr cycle)
        collect (-sort-edge (list a b))))


(defun edge-set->graph (es)
  (declare (list es))
  "create a graph from edges in edge set."
  (loop with grph = (make)
        for (a b) in es do (add grph a b)
        finally (return grph)))


(defun path->edge-set (path &key closed)
  (declare (list path) (boolean closed))
  "return edge set from cycle.
ex: (1 2 3 4 5) -> ((1 2) (2 3) (3 4) (4 5))
if closed is t, (1 5) will be included in the above output."
  (loop for a in path
        and b in (if closed (cons (first (last path)) path) (cdr path))
        collect (sort (list a b) #'<)))


(defun -edge-map (es)
  (declare (list es))
  (let ((edge-map (make-hash-table :test #'equal)))
    (labels ((-insert (a b)
               (multiple-value-bind (_ exists) (gethash a edge-map)
                 (declare (ignore _))
                 (if exists (push b (gethash a edge-map))
                            (setf (gethash a edge-map) (list b))))))
      (loop for (a b) in es do (-insert a b)
                               (-insert b a)))
    edge-map))

(defun edge-set->path (es)
  (declare (list es))
  "convert edge set: ((3 4) (4 5) (5 6) (1 2) (6 1) (2 3))
into a path: (4 5 6 1 2 3)
second result is a boolean for whether it is a cycle."

  (when (< (length es) 2)
        (return-from edge-set->path (values (car es) nil)))

  (let ((edge-map (-edge-map (cdr es))))
    (labels
      ((-next-vert-from (a &key but-not)
         (car (remove-if (lambda (v) (= v but-not))
                         (gethash a edge-map))))
       (-until-dead-end (a but-not)
         (loop with prv = a
               with res = (list prv)
               with nxt = (-next-vert-from a :but-not but-not)
               until (equal nxt nil)
               do (push nxt res)
                  (let ((nxt* (-next-vert-from nxt :but-not prv)))
                    (setf prv nxt nxt nxt*))
               finally (return res))))

      (destructuring-bind (a b) (car es)
        (let ((left (-until-dead-end a b)))
          (when (and (= (car left) b) (= (car (last left)) a))
                ; this is a cycle
                (return-from edge-set->path (values left t)))
          ; not a cycle
          (let* ((right (-until-dead-end b a))
                 (res (concatenate 'list left (reverse right))))
            ; this isnt an exhaustive manifold test?
            ; and it should be configurable whether it fails?
            (unless (= (1- (length res)) (length es))
                    (error "path is manifold or incomplete:~%~a~% eslen: ~a. pathlen ~a"
                           res (length es) (length res)))
            (values res nil)))))))


(defun edge-set-symdiff (a b)
  (declare (list a b))
  "symmetric difference of edge set a and b. not very efficient." ; i think?
  (remove-if (lambda (e) (and (member e a :test #'equal)
                              (member e b :test #'equal)))
             (union a b :test #'equal)))


(defun cycle-basis->edge-sets (basis)
  (declare (list basis))
  "return an edge set for every cycle in a cycle basis.
it does not check if the cycle basis is correct. cycles must be closed.
that is, they must begin and end on the same vertex."
  (loop for c of-type list in basis collect (cycle->edge-set c)))

; TODO: edge-set->path will only return a cycle
; if the edge set is a cycle. warn?
(defun edge-sets->cycle-basis (es)
  (declare (list es))
  "the opposite of cycle-basis->edge-sets."
  (loop for e of-type list in es
        collect (math:close-path (edge-set->path e))))

(defun -edge-set-weight (es weightfx)
  (declare (list es) (function weightfx))
  (loop for e of-type list in es sumMing (apply weightfx e)))

(defun -sort-edge-sets (edge-sets weightfx)
  (declare (list edge-sets) (function weightfx))
  (mapcar #'second
    (sort (loop for es of-type list in edge-sets
                collect (list (-edge-set-weight es weightfx) es))
          #'> :key #'first)))

