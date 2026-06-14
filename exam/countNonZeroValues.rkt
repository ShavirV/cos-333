#lang racket

(define (countNonZeroValues lst)
  (cond
    ((null? lst) 0)
    ((zero? (car lst)) (countNonZeroValues (cdr lst)))
    (else (+ 1 (countNonZeroValues  (cdr lst))))))

(countNonZeroValues '())
(newline)
(countNonZeroValues '(0 0))
(newline)
(countNonZeroValues '(3 0 -8 0))