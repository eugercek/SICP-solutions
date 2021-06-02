(define (square x) (* x x))

(define (mr-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (nt-sqrt-mod a n) ;; non-trivial-sqaure-root-mod-n
  (if (or (= a 1) (= a (- n 1)))
      false
      (= (remainder (square a) n) 1)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (if (nt-sqrt-mod base m)
             0
             (remainder
              (square (expmod base (/ exp 2) m))
              m)))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (mr-prime? n times)
  (cond ((= times 0) true)
        ((mr-test n) (mr-prime? n (- times 1)))
        (else false)))

;; 10 is random value
(mr-prime? 68 10)
