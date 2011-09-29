; -*- mode: lisp; package: user; encoding: shift_jis -*-

;;; ansi-loop/package.l
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
  (unless (find-package :ansi-loop)
    (defpackage :ansi-loop
      (:use
       :lisp
       )
      ;; 互換性のため cmu_loop.l の定義を上書きしない
      (:shadow
       :loop
       :loop-finish
       ))))


(provide "ansi-loop/package")

;;; End
