#lang racket

(define (factorial N) (cond
                        [(< N 2) 1]
                        [else (* N (factorial (- N 1)))]))
(define (sum-digits N acc) (cond
                             [(< N 10) (+ N acc)]
                             [else (sum-digits (floor (/ N 10)) (+ (modulo N 10) acc))]))
(define (f N) (sum-digits (factorial N) 0))