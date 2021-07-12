(define (compose f g)
  (lambda (x)
    (f (g x))))

<<compose>>
((compose (lambda (x) (* x x)) inc) 6)
