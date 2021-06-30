#lang racket

(define ht (make-hash))

(define (define-class name)
  (lambda (tag)
    (cond ((eq? tag 'name) name)
          ((eq?  age) age)
          (else (set! name "Changed!!")))))

(hash-set! ht 'name "umut")
(hash-set! ht 'age 20)

(hash-ref ht 'age)
