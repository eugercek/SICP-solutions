(define (double f)
  (lambda (x)
    (f(f x))))

;; (double double)
;; (lambda (f) (double (double f))) ;; foo
;; (double (lambda (f) (double (double f))))

;; (double foo)
;; (lambda (x) (foo(foo x)))

(((lambda (x) ((lambda (f) (double (double f)))
             ((lambda (f) (double (double f))) x))) inc) 5)
