(define (double x) (* x 2))
(define (halve x)  (/ x 2))

(define (product a b)
  (define (iter times big sum)
    (cond ((= times 0) sum)
          ((even? times) (iter (halve times) (double big) sum))
          (else
           (iter (- times 1) big (+ sum big)))))
  (if (< a b)
      (iter a b 0)
      (iter b a 0)))
