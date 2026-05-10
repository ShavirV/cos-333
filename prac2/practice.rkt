#lang racket

(define (coneVolume r h )
  (let (
        (pi 3.14)
        (r2 (* r r))
        (third (/ h 3))
        )
   ;function body
   (cond 
          ((<= h 0) 0)
          ((<= r 0) 0)
          (else (* pi  r third))
   )))

(display (coneVolume 12 12))


;look at car list
;if car list == null, return null
;if car list == atom, move on to evaluate cdr list, and append to car list
;if car list != atom, cons car list car list (evaluate cdr list)

(define (duplicateNonMatchingValues list atom)
   (cond
     ((null? list) '())
     ((eqv? (car list) atom) (cons (car list) (duplicateNonMatchingValues (cdr list) atom)))
     (else (cons (car list) (cons (car list) (duplicateNonMatchingValues (cdr list) atom))))))
    

display(duplicateNonMatchingValues '(a b c) 'a)


; pi r (r + sqrt(h^2 + r^2)
(define (coneArea r h)
  (let (
       (pi 22/7)
       (h2 (* h h))
       (r2 (* r r))
       )
  (cond
    ((<= h 0) 0)
    ((<= r 0) 0)
    ((* pi r (+ r (sqrt (+ (* r r) (* h h)))))))))

(newline)
(display(coneArea 1.2 2.1))

(newline)

(define (countDivisors atm lst)
  (cond
    ((null? lst) 0)
    ((= (modulo atm (car lst)) 0) (+ 1 (countDivisors atm (cdr lst))))
    (else (countDivisors atm (cdr lst)))))

(display (countDivisors 6 '(1 4 3 12)))

