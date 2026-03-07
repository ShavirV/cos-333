#lang racket


; pi r^2 * h / 3

(define (coneVolume r h)
  (let ((pi (/ 22 7)))
    (if (or ( <= r 0) (<= h 0))
        0
        (/ (* pi (* r r) h) 3))))
     
(display (coneVolume 1.5 2.1))
(newline)
(display (coneVolume -3 2.1))
(newline)
(display (coneVolume 1.5 0))
(newline)
(display (coneVolume 1.5 300))