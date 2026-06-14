#lang racket

;holy riddles
;case negative, take absolute
;case positive, take 1/val
;case zero, take 1
;and sum everything up
(define (fn lst)
  (cond
    ((null? lst) 0)
    ((negative? (car lst)) (+ (abs (car lst)) (fn (cdr lst))))
    ((positive? (car lst)) (+ (/ 1 (car lst)) (fn (cdr lst))))
    ((zero? (car lst))     ( + 1 (fn (cdr lst))))))

(fn '())
(newline)
(fn '(2 4))
(fn '(-2 -4))
(fn '(0 2 -4))