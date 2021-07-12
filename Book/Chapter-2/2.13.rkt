(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-interval (- c (/ (* c p) 100))
                 (+ c (/ (* c p) 100))))
(define (percent i)
  (/  (* 100 (width i)) (center i)))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))


(percent (mul-interval (make-center-percent 10000 0.001)
                       (make-center-percent 10000 0.001)))
(+ 0.001 0.001)

(percent (mul-interval (make-center-percent 100000000 0.00001)
                       (make-center-percent 100000000 0.00001)))
(+ 0.00001 0.00001)
