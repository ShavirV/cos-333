#lang racket

(define (removePositiveOddValues lst)
  (cond
    ((null? lst) '())
    ((and (odd? (car lst)) (> (car lst) 0))
     (removePositiveOddValues (cdr lst)))
    (else
     (cons (car lst) (removePositiveOddValues (cdr lst)))))); maintain current head and recurse on rest

(display (removePositiveOddValues '(1 2 3 4 5 6 7 8 9)))
(newline)