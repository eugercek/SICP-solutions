(require sdraw)
(define (draw t) (sdraw t #:null-style '/))
(draw (list 1 (list 2 (list 3 4))))
