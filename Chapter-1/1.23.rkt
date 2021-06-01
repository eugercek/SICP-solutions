<<prime-functions>>
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes min-val)

  (define (search cur-val)
    (if (prime? cur-val)
        (timed-prime-test cur-val)
        (search (+ 2 cur-val)))) ;; No need for optimization question wants this `primality of consecutive odd integers`

  (define (next n)
    (if (= n 2)
        3
        (+ n 2)))

  (search (next min-val)))
