(define (square x) (* x x))

(define (repeated f n)
  (lambda (x)
    (define (iter i)
      (if (> i n)
          x
          (f (iter (+ i 1)))))
    (iter 1)))

((repeated square 2) 5)

<<compose>>
(define (square x) (* x x))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))
