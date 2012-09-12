#lang racket
(require "basic.rkt")

(define-syntax-rule (test a b)
  (unless (equal? a b)
    (error 'test "failed")))

(test x '(a 2 "c" '(d)))
(test "ok" ((v-f i) "ok"))
(test add1 (v-f (v add1)))
(test #t (v? i))

(test 'err (with-handlers ([exn:fail:contract? (lambda (exn) 'err)])
             (f "a")))
(test 0 (f 0))

(test 'err (with-handlers ([exn:fail:contract? (lambda (exn) 'err)])
             (ordinal "x")))
