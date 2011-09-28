; -*- mode: lisp; package: ansi-loop; encoding: shift_jis -*-

;;; ansi-loop/missing.l
;;
;; Copyright (c) 2011 MIYAMUKO Katsuyuki.
;;
;; Permission to use, copy, modify, and distribute this software and its
;; documentation for any purpose and without fee is hereby granted,
;; provided that the above copyright notice appear in all copies and that
;; both that copyright notice and this permission notice appear in
;; supporting documentation.

;;; Code:

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "ansi-loop/package")
  )

(in-package :ansi-loop)

(defmacro typecase (keyform &body cases)
  `(case (type-of ,keyform)
     ,@cases))
(setf (get 'typecase 'ed::lisp-indent-hook) 1)

(defmacro ecase (keyform &rest cases)
  `(case ,keyform
     ,@cases
     (t
      (error 'type-error
             :datum ',keyform
             :expected-type ',(if (cdr cases)
                                  `(or ,@(mapcar #'car cases))
                                (caar cases)))
      )))
(setf (get 'ecase 'ed::lisp-indent-hook) 1)

(defmacro the (value-type form)
  `(progn ,form))

(defun signal-program-error (format-string &rest format-args)
  (error 'simple-program-error
         :format-string format-string
         :format-arguments format-args))

(defun special-operator-p (symbol)
  (special-form-p symbol))


(provide "ansi-loop/missing")

;;; End
