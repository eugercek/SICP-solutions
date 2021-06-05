(define (cons a b)
  (* (expt 2 a)
     (expt b)))

(define (count base num)
  (if (= (remainder num base) 0)
      (+ 1 (count base(/ num base)))
      0))

(define (car p)
  (count 2 p))

(define (cdr p)
  (count 3 p))

(car (cons 5 9))
(cdr (cons 5 9))
