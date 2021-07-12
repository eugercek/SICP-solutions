(define (even? x)
  (= (remainder x 2) 0))

(define (square x) (* x x))

(define (fast-exp b n) ;; b^n
  (define (iter a b n) ;; b is current multiplied value. a is product
    (cond
      ((= n 0) a)
      ((even? n) (iter a (square b) (/ n 2)))
      (else
       (iter (* a b) b (- n 1)))))
  (iter 1 b n))

(fast-exp 2 3)
