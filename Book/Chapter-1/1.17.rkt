(define (even? x)
  (= (remainder x 2) 0))

(define (double x) (* x 2))
(define (halve x)  (/ x 2))

(define (product a b)
  (define (prod times big)
    (cond
      ((= 0 times) 0)
      ((even? times) (prod (halve times) (double big)))
      (else (+ big (prod (- times 1) big)))))

  (if (< a b)
      (prod a b)
      (prod b a)))

(product 10 4)
