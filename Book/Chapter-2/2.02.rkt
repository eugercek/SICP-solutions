(define (average x y) (/ (+ x y) 2))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment p)
  (car p))

(define (end-segment p)
  (cdr p))

(define (midpoint-segment s)
  (make-point
   (average (x-point (start-segment s))
            (x-point (end-segment s)))
   (average (y-point (start-segment s))
            (y-point (end-segment s)))))

<<point>>
<<segment>>
(define p1 (make-point 0 0))
(define p2 (make-point 10 10))

(define s (make-segment p1 p2))

(print-point (midpoint-segment s))
