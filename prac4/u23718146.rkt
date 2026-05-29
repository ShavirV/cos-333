#lang racket


(define (sumAbsNegativeFracPositivesCountZeros lst)
  (cond
    ((null? lst) 0)

    ;see a negative, abs the value and add it
    ((negative? (car lst)) 
     (+ (abs (car lst))
        (sumAbsNegativeFracPositivesCountZeros (cdr lst))))

    ;see a positive, add the fraction val^-1
    ((positive? (car lst))
     (+ (/ 1.0 (car lst))
        (sumAbsNegativeFracPositivesCountZeros (cdr lst))))

    ;count zeroes as 1
    ((zero? (car lst))
     (+ 1
        (sumAbsNegativeFracPositivesCountZeros (cdr lst))))))

;(sumAbsNegativeFracPositivesCountZeros '())
; 0

;(sumAbsNegativeFracPositivesCountZeros '(2 4))
; 0.75

;(sumAbsNegativeFracPositivesCountZeros '(-2 -4))
; 6

;(sumAbsNegativeFracPositivesCountZeros '(0 2 -4))
; 5.5

;(sumAbsNegativeFracPositivesCountZeros '(-1 0 4 2 -3))
; 5.75