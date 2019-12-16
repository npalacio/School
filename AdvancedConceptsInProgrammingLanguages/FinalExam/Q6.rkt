#lang racket

(define (factorial N) (cond
                        [(< N 2) 1]
                        [else (* N (factorial (- N 1)))]))