(define (accumulator combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulator combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulator + 0 term a next b))

(sum (lambda (x) x) 1 inc 5)

(define (accumulator combiner null-value term a next b)
  (define (iter x)
    (if (> x b)
        null-value
        (combiner (term x)
                  (iter (next x)))))
  (iter a))

(define (sum term a next b)
  (accumulator + 0 term a next b))

(define (accumulator combiner null-value term a next b)
  (define (iter x acc)
    (if (> x b)
        acc
        (iter (next x)
              (combiner (term x) acc))))
  (iter a null-value))

(define (sum term a next b)
  (accumulator + 0 term a next b))
