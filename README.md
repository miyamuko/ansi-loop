# ansi-loop - ANSI Common Lisp LOOP macro for xyzzy Lisp

* Home URL: <http://miyamuko.s56.xrea.com/xyzzy/ansi-loop/intro.htm>
* Version: 1.0.1


## SYNOPSIS

```lisp
;;; xyzzy lisp REPL
user> (require "cmu_loop")
t

user> (loop for i from 0 to 10
        when (and (> i 3) i)
        collect it
        when (> i 6)
        do (loop-finish))
変数が定義されていません: it

user> (require "ansi-loop")
t

user> (shadowing-import '(ansi-loop:loop
                          ansi-loop:loop-finish))
t

user> (loop for i from 0 to 10
         when (and (> i 3) i)
         collect it
         when (> i 6)
         do (loop-finish))
(4 5 6 7)
```


## DESCRIPTION

ansi-loop は [Macintosh Common Lisp] の loop マクロ (loop.lisp と extended-loop.lisp) を xyzzy に移植したものです。

xyzzy 付属の cmu_loop.l は少しバグっているので、Common Lisp のライブラリを移植する場合などに
不都合が生じる場合がありますが、ansi-loop を使えば解決するかもしれません。

ちなみに、MCL の loop マクロは元々 Symbolics の loop マクロから余分なコードを取り除いたもののようです。
また、Symbolics の loop マクロはオリジナルの MIT の loop マクロを更新したもののようです。

というわけで以下のような系統図になります。

    MIT LOOP  ->  Symbolics ANSI LOOP  ->  MCL  ->  xyzzy

参考: [LOOP: A variety of Loop macros.]

  [Macintosh Common Lisp]: http://code.google.com/p/mcl/
  [LOOP: A variety of Loop macros.]: http://www.cs.cmu.edu/afs/cs/project/ai-repository/ai/lang/lisp/code/iter/loop/0.html

## INSTALL

1. [NetInstaller] で ansi-loop, ansify をインストールします。

2. ansi-loop はライブラリであるため自動的にロードはされません。
   必要な時点で require してください。

  [NetInstaller]: http://www7a.biglobe.ne.jp/~hat/xyzzy/ni.html

## REFERENCE

パッケージ名は ansi-loop です。ニックネームはありません。
ansi-loop では以下の関数・マクロを export しています。

* ansi-loop:loop
* ansi-loop:loop-finish
* ansi-loop:define-loop-iteration-path
* ansi-loop:define-loop-sequence-path

cmu_loop.l のバグに依存しているアプリケーションがあるかもしれないので、
lisp::loop および lisp::loop-finish は安全のため上書きしません。

ansi-loop を利用したい場合は必要な関数・マクロを ansi-loop パッケージから
shadowing-import してください。

```lisp
(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (find-package :your-cool-application)
    (require "ansi-loop")

    (defpackage :your-cool-application
      (:use :lisp :editor)
      (:shadowing-import-from :ansi-loop
       :loop
       :loop-finish
       :define-loop-iteration-path
       :define-loop-sequence-path
       ))
    ))
```


## TODO

なし。


## KNOWN BUGS

なし。

要望やバグは [GitHub Issues] か [@miyamuko] まで。

  [GitHub Issues]: http://github.com/miyamuko/ansi-loop/issues
  [@miyamuko]: http://twitter.com/home?status=%40miyamuko%20%23xyzzy%20ansi-loop%3a%20


## AUTHOR

みやむこ かつゆき (<mailto:miyamuko@gmail.com>)


## ACKNOWLEDGEMENT

MIT の loop マクロなど、[@g000001] さんにいろいろ教えてもらいました。

  [@g000001]: http://twitter.com/#!/g000001

## COPYRIGHT

ansi-loop は Historical Permission Notice and Disclaimer (HPND) ライセンスに従って
本ソフトウェアを使用、再配布することができます。

    Portions of LOOP are Copyright (c) 1986 by the Massachusetts Institute of Technology.
    All Rights Reserved.

    Permission to use, copy, modify and distribute this software and its
    documentation for any purpose and without fee is hereby granted,
    provided that the M.I.T. copyright notice appear in all copies and that
    both that copyright notice and this permission notice appear in
    supporting documentation.  The names "M.I.T." and "Massachusetts
    Institute of Technology" may not be used in advertising or publicity
    pertaining to distribution of the software without specific, written
    prior permission.  Notice must be given in supporting documentation that
    copying distribution is by permission of M.I.T.  M.I.T. makes no
    representations about the suitability of this software for any purpose.
    It is provided "as is" without express or implied warranty.

         Massachusetts Institute of Technology
         77 Massachusetts Avenue
         Cambridge, Massachusetts  02139
         United States of America
         +1-617-253-1000

    Portions of LOOP are Copyright (c) 1989, 1990, 1991, 1992 by Symbolics, Inc.
    All Rights Reserved.

    Permission to use, copy, modify and distribute this software and its
    documentation for any purpose and without fee is hereby granted,
    provided that the Symbolics copyright notice appear in all copies and
    that both that copyright notice and this permission notice appear in
    supporting documentation.  The name "Symbolics" may not be used in
    advertising or publicity pertaining to distribution of the software
    without specific, written prior permission.  Notice must be given in
    supporting documentation that copying distribution is by permission of
    Symbolics.  Symbolics makes no representations about the suitability of
    this software for any purpose.  It is provided "as is" without express
    or implied warranty.

    Symbolics, CLOE Runtime, and Minima are trademarks, and CLOE, Genera,
    and Zetalisp are registered trademarks of Symbolics, Inc.

         Symbolics, Inc.
         8 New England Executive Park, East
         Burlington, Massachusetts  01803
         United States of America
         +1-617-221-1000

    Portions of LOOP are Copyright (c) 2011 MIYAMUKO Katsuyuki.
    All Rights Reserved.

    Permission to use, copy, modify, and distribute this software and its
    documentation for any purpose and without fee is hereby granted,
    provided that the above copyright notice appear in all copies and that
    both that copyright notice and this permission notice appear in
    supporting documentation.
