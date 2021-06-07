(define (cc amount coin-values)
  (define (no-more? l) (null? l))
  (define (except-first-denomination l) (cdr l))
  (define (first-denomination l) (car l))
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination
                 coin-values))
            (cc (- amount
                   (first-denomination
                    coin-values))
                coin-values)))))

(define us-coins (list 50 25 10 5 1))
(define fake-us-coins (list 1 10 25 5 50))

(cc 100 us-coins)
(cc 100 fake-us-coins)
