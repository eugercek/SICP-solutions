(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define i1 (make-interval 10 20))
(define i2 (make-interval 30 50))

(width i1)
(width i2)
(width (add-interval i1 i2))

<<interval>>
<<mul>>

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define i1 (make-interval 0 10))
(define i2 (make-interval 100 110))

(width i1)
(width i2)
(width (mul-interval i1 (make-interval 5 10)))
(width (mul-interval i2 (make-interval 5 10)))
