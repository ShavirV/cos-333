#lang racket

(define (doublePosAbsNegatives lst)
  (cond
    ((null? lst) '())
    ((zero? (car lst)) (doublePosAbsNegatives (cdr lst)))
    ((positive? (car lst)) (cons (* 2 (car lst)) (doublePosAbsNegatives (cdr lst))))
    (else (cons (abs (car lst)) (doublePosAbsNegatives (cdr lst))))))

(display (doublePosAbsNegatives '()))
(newline)
(display (doublePosAbsNegatives '(0)))
(newline)
(display (doublePosAbsNegatives '(2 -2 0 3)))
(newline)