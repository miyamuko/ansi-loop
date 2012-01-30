; -*- mode: lisp; package: ansi-loop; encoding: shift_jis -*-

;;; ansi-loop/missing.l
;;
;; Portions of LOOP are Copyright (c) 2011 MIYAMUKO Katsuyuki.
;; All Rights Reserved.
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

(defun signal-program-error (format-string &rest format-args)
  (error 'simple-program-error
         :format-string format-string
         :format-arguments format-args))


(provide "ansi-loop/missing")

;;; End
