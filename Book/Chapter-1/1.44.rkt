<<repeated>>
(define (smooth f)
  (let ((dx 0.0001))
    (lambda (x)
      (+ (f x)
         (f (+ x dx))
         (f (- x dx))))))

(define (n-fold f n)
  (repeated (smooth f) n))
