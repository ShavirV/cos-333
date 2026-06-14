#lang racket

(define (getZerosDoublePositives lst)
  (cond
    ((null? lst) '()) ;base case see empty return empty
    ((negative? (car lst)) (getZerosDoublePositives (cdr lst))) ;ignore negative
    ((positive? (car lst)) (cons (* 2 (car lst)) (getZerosDoublePositives (cdr lst))))
    (else (cons (car lst) (getZerosDoublePositives (cdr lst))))))


(display (getZerosDoublePositives '(0 1 2 3 -1 -2 -3 2 0 2 3)))