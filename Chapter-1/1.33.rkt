(define (filtered-accumulate combiner null-value
                             term a next b predicate)
  (define (iter x)
    (if (> x b)
        null-value
        (let ((val (if (predicate x)
                       (term x)
                       null-value)))
          (combiner val
                    (iter (next x))))))
  (iter a))

<<prime-functions>>
<<filtered-accumulate>>
(define (prime-square a b)
  (filtered-accumulate + 0 square a inc b prime?))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(require racket/trace)
(define (square x) (* x x))

(define (divides? a b) (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n) (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))
(define (filtered-accumulate combiner null-value
                             term a next b predicate)
  (define (iter x)
    (if (> x b)
        null-value
        (let ((val (if (predicate x)
                       (term x)
                       null-value)))
          (combiner val
                    (iter (next x))))))
  (iter a))
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (relat-prime-product b)
  (filtered-accumulate * 1 (lambda (x) x) 2 inc b (lambda (x)
                                                    (= (gcd x b) 1))))
