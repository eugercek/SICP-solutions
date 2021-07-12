(define (sum-of-larger-two x y z)
  (- (+ (square x) (square y) (square z))
     (square (min x y z))))

(define (square x) (* x x))

(sum-of-larger-two 3 4 5)
