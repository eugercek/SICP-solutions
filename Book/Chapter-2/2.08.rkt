(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))
(define (sub-interval a b)
  (make-interval
   (- (lower-bound a) (lower-bound b))
   (- (upper-bound a) (upper-bound b))))
