#lang racket
(define (iota-helper N) (cond
                   [(zero? N) null]
                   [else (cons (- N 1) (iota-helper (- N 1)))]))
(define (iota N) (reverse (iota-helper N)))