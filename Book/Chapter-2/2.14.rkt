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
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (div-interval x y)
  (if (or (zero? (upper-bound y))
          (zero? (lower-bound y)))
      (error "(div-interval x y) Y can't be 0")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
                       (div-interval one r2)))))

(define r1 (make-interval 10 20))
(define r2 (make-interval 10 20))

(par1 r1 r2)
(par2 r1 r2)

<<center>>
<<add>>
<<mul>>
<<div>>
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define r1 (make-interval 10 20))
(define r2 (make-interval 10 20))

(par1 r1 r2) ;; 2.5 Wrong

(mul-interval r1 r2) ;; 100 True

(add-interval r1 r2);; 20 True

(div-interval ;; Should be 5 but 2.5
 (mul-interval r1 r2)
 (add-interval r1 r2))

;; (define (div-interval x y)
;;   (if (or (zero? (upper-bound y))
;;           (zero? (lower-bound y)))
;;       (error "(div-interval x y) Y can't be 0")
;;       (mul-interval
;;        x
;;        (make-interval (/ 1.0 (upper-bound y))
;;                       (/ 1.0 (lower-bound y))))))

(mul-interval (make-interval 100 400)
              (make-interval
               (/ 1.0 40)
               (/ 1.0 20)))

(* 100 (/ 1.0 40)) ;; This is the prolem
