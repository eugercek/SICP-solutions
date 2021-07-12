(define (tan-cf x k)
  (define (square x) (* x x))
  (define (iter i)
     (if (> i k)
         0
         (/ (square x)
            (- (inc (* 2 i)) (iter (inc i))))))
  (/ x (- 1.0 (iter 1))))

(tan-cf 1 10)
