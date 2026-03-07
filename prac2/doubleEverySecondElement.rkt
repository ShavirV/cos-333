#lang racket

(define (doubleEverySecondElement lst)
  (cond
    ((null? lst) '())
    ((null? (cdr lst)) '())
    (else
      (cons (* 2 (car (cdr lst)))
            (doubleEverySecondElement (cdr (cdr lst))))))) ;skip every other element 


(display (doubleEverySecondElement '()))
(newline)
(display (doubleEverySecondElement '(4 6)))
(newline)
(display (doubleEverySecondElement '(4 6 2 3)))
(newline)
(display (doubleEverySecondElement '(1 2 3 4 5 6)))
(newline)