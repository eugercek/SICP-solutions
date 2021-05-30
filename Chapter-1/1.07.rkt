<<sqrt-functions>>
(sqrt 0.0000000000000000000000001232131)
(sqrt 0.000000000000000000000001)

<<sqrt-functions>>
(sqrt 10000000000000000000000000000000000000000000000000)
(sqrt 1000000000000000000000000000000000000000000000000000000000000000000000)

(define (improve guess x)
  (display "-")
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))
(- (square 0.03125) 0)
