; -*- mode: lisp; package: ansi-loop; encoding: shift_jis -*-

;;; ansi-loop/version.l
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

(export '(ansi-loop-version
          ))

(defconstant +ansi-loop-version+ "1.0.1")

(defun ansi-loop-version ()
  +ansi-loop-version+)


(provide "ansi-loop/version")

;;; End
