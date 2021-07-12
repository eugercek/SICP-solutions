(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (sum a b)
  (if (= a 0)
      b
      (inc (sum (dec a) b))))
(+ 4 5)

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (sum a b)
  (if (= a 0)
      b
      (sum (dec a) (inc b))))

(sum 4 5)
