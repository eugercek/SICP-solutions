(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson f a b n)

  (define h (/ (- b a) n))
  (define (even? x) (= (remainder x 2) 0))
  (define (cof x)
    (if ((even? x) 0)
        2
        4))

  (define (next-k k) (+ k h))

  (define (f-wrap x)
    (if (even? x)
        (* 2 (f x))
        (* 4 (f x))))

  (* (/ h 3.0) ;; For floating point value
     (+
      (f a) ;; First Element
      (sum  f-wrap (+ a 1) next-k (- b 1))
      (f b)))) ;; Last element

(define (cube x) (* x x x ))

(simpson cube 0 1 1000)
