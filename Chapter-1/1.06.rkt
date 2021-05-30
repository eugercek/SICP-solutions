(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
(new-if (< 3 5) (display "Then\n") (display "Else"))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
