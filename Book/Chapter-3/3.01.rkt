(define (make-accumulator main)
  (lambda (income)
    (begin
      (set! main (+ main income))
      main)))

(define acc (make-accumulator 100))
(acc 0)
(acc 10)
