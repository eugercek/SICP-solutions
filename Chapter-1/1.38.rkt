(define (e-expansion i)
  (define (mod3 i) (remainder i 3))
  (if (= (mod3 i) 2)
      (/ (inc i) 1.5)
      1))

<<cont-frac>>
<<e-expansion>>
(define (euler k)
  (+ 2
     (cont-frac (lambda (i) 1)
                e-expansion
                k)))
(euler 10)
