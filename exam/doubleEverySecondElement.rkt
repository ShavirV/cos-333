#lang racket

(define (doubleEverySecondElement lst)
  (cond
    ((null? lst) '())
    ((null? (cdr lst)) '())
    (else (cons (* 2 (car (cdr lst)))(doubleEverySecondElement (cdr (cdr lst)))))))

(doubleEverySecondElement '())
(doubleEverySecondElement '(4 6))
(doubleEverySecondElement '(4 6 2 3))