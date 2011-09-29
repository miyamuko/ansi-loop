; -*- mode: lisp; package: ansi-loop.test.helper; encoding: shift_jis -*-

;;; ansi-loop/test/helper.l
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

(defpackage :ansi-loop.test.helper
  (:use :lisp :editor :lisp-unit))

(in-package :ansi-loop.test.helper)

(export '(assert
          the
          test
          ))

(defmacro assert (form)
  `(unless ,form
     (error "Assertion failed: ~S" ',form)))

(defmacro the (value-type form)
  `(progn ,form))

(defmacro test (short-desc lambda-list form &body params-and-answers)
  `(define-test ,short-desc
     ,@(mapcar #'(lambda (param-and-answer)
                   `(assert-equal
                        ',(cadr param-and-answer)
                        ,(if lambda-list
                             `(let (,@(mapcar #'(lambda (var val)
                                                  (if (atom val)
                                                      `(,var ,val)
                                                    `(,var ',val)))
                                              lambda-list
                                              (car param-and-answer)))
                                ,form)
                           form)))
               params-and-answers)))

(provide "ansi-loop/test/helper")

;;; End
