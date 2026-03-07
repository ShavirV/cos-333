#lang racket

(define (countNonZeroValues lst)
  (if (null? lst)
      0
      (if (= (car lst) 0) ;car to get the first element
          (countNonZeroValues (cdr lst)) ;resf of the list, recursively 'deq' the list and count
          (+ 1 (countNonZeroValues (cdr lst)))))) ;implicit elses see a nonzero


(display (countNonZeroValues '()))
(newline)
(display (countNonZeroValues '(0 0)))
(newline)
(display (countNonZeroValues '(3 0 -8 0)))
(newline)
(display (countNonZeroValues '(1 2 3 4)))
(newline)