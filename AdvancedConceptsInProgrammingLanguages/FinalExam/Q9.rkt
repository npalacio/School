#lang racket
(require racket/trace)

(trace-define (recursive-sum l) (cond
                            [(null? (cdr l)) (car l)]
                            [else (+ (car l) (recursive-sum (cdr l)))]))

(trace-define (tail-recursive-sum-helper l acc) (cond
                                           [(null? l) acc]
                                           [else (tail-recursive-sum-helper (cdr l) (+ (car l) acc))]))
(trace-define (tail-recursive-sum l) (tail-recursive-sum-helper l 0))