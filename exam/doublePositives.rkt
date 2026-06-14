#lang racket

(define (doublePositives lst)
  (cond
    ((null? lst) '())
    ((positive? (car lst)) (cons (* 2 (car lst)) (doublePositives (cdr lst))))
    (else (cons (car lst) (doublePositives (cdr lst))))))

(doublePositives '())
(newline)
(doublePositives '(2 -4 7 -3))