(define (rec-f n)
  (if (< n 3)
      n
      (+ (rec-f (- n 1))
         (* 2 (rec-f (- n 2)))
         (* 3 (rec-f (- n 3))))))

(define (inc x) (+ x 1))

(define (it-f n)
  (define (iter count fn-3 fn-2 fn-1)
    (define fn ;; Next item
      (+ fn-1
         (* 2 fn-2)
         (* 3 fn-3)))
    (cond
      ((< n 3) n)
      ((= count (- n 3)) fn)
      (else
       (iter (inc count)
             fn-2 fn-1 fn))))
  (iter 0 0 1 2))
