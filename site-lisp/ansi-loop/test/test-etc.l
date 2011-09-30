; -*- mode: lisp; package: ansi-loop.test.etc; encoding: shift_jis -*-

;;; ansi-loop/test/test-etc.l
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

(require "lisp-unit")
(require "ansi-loop")
(require "ansi-loop/test/helper")

(defpackage :ansi-loop.test.etc
  (:use
   :lisp :editor :lisp-unit :ansi-loop.test.helper)
   )

(in-package :ansi-loop.test.etc)

(remove-all-tests :ansi-loop.test.etc)

(define-test print-loop-universe
  (flet ((test (ansi expected)
           (let* ((u (ansi-loop::make-loop-universe :ansi ansi))
                  (s (format nil "~A" u)))
             (assert-string-match "^#<ansi-loop::loop-universe " s)
             (assert-string-match expected s)
             (assert-string-match (format nil "~A" (si:address-of u)) s))))
    (test nil " Non-ANSI ")
    (test t " ANSI ")
    (test :extended " Extended-ANSI ")
    (test :hoge " hoge ")
    ))
