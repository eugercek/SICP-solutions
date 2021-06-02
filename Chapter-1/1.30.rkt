(define (sum term a next b)
  (define (iter a result)
    (if
     (> a b)
     result
     (iter
      (next a) (+ (term a) result))))
  (iter a 0))

(define (identity x) x)
(define (sum-integers a b)
  (sum identity a inc b))
(sum-integers 1 10)