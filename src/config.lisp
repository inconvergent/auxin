;;; These are configuration settings for the project.
;;;
;;; These settings aren't particularly friendly to projects more
;;; broadly as they're not "self contained."

(in-package #:auxin)

(setf *random-state* (make-random-state t)
      *print-pretty* t)

(declaim (single-float *eps*) (boolean *dev*))
(defparameter *eps* veq::*eps*)
(defparameter *srndopt* '(optimize speed (safety 0) (debug 1)))

(init-config (optimize safety (speed 0) debug (space 1))
             (optimize (safety 1) (speed 3) (debug 1) (space 2) (compilation-speed 0)))

