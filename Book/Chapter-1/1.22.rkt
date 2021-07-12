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

  (define (next-odd x)
    (if (= (remainder x 2) 0)
        (+ x 1)
        (+ x 2)))

  (search (next-odd min-val)))



(search-for-primes 1000000)
(search-for-primes 1000000000)
(search-for-primes 1000000000000)
