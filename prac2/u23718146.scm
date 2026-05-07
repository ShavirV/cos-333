#lang racket


; pi r^2 * h / 3

(define (coneVolume r h)
  (let ((pi (/ 22 7)))
    (if (or ( <= r 0) (<= h 0)) ;handle invalid input
        0
        (/ (* pi (* r r) h) 3)))) ;implicit else block, actually calculate
     

;;;task 2:

(define (countNonZeroValues lst)
  (if (null? lst)
      0
      (if (= (car lst) 0) ;car to get the first element. if we find a 0, ignore
          (countNonZeroValues (cdr lst)) ;resf of the list, recursively 'deq' the list and count
          (+ 1 (countNonZeroValues (cdr lst)))))) ;implicit else see a nonzero



;;;task 3

(define (doubleEverySecondElement lst)
  (cond ;cond works like a switch statement
    ((null? lst) '()) ;no elems left, return empty
    ((null? (cdr lst)) '()) ;last elem, also return empty
    (else
      (cons (* 2 (car (cdr lst))) ;double next element in list
            (doubleEverySecondElement (cdr (cdr lst))))))) ;skip every other element 




;;Task 1
(display(coneVolume 1.2 3.6))
(newline)
(display(coneVolume -1.2 3.6))
(newline)
(display(coneVolume 1.2 -3.6))
(newline)
(display(coneVolume -1.2 -3.6))
(newline)
;;Task 2
(display(countNonZeroValues '()))
(newline)
(display(countNonZeroValues '(0 0)))
(newline)
(display(countNonZeroValues '(3 -2)))
(newline)
(display(countNonZeroValues '(-3 0 3 0 -1)))
(newline)
;;Task 3
(display(doubleEverySecondElement'()))
(newline)
(display(doubleEverySecondElement'(5)))
(newline)
(display(doubleEverySecondElement'(5 2)))
(newline)
(display(doubleEverySecondElement'(5 2 6)))
(newline)
(display(doubleEverySecondElement'(5 2 6 5 3)))