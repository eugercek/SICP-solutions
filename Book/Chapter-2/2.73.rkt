(define (install-deriv-package)
  (install-sum-package)
  (install-product-package))

(define (install-sum-package)
  ;; internal procedures
  (define (variable? x) (symbol? x))
  (define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))
  (define (=number? exp num) (and (number? exp) (= exp num)))

  (define (sum? x) (and (pair? x) (eq? (car x) '+)))
  (define (addend s) (car s))
  (define (augend s) (cadr s))

  (define (make-sum a1 a2)
    (cond
      ((=number? a1 0) a2)
      ((=number? a2 0) a1)
      ((and (number? a1)
            (number? a2))
       (+ a1  a2))
      (else (list '+  a1 a2))))

  ;; interface to the rest of the system
  (define (deriv-sum args)
    (make-sum (deriv (addend args1))
              (deriv (augend args2))))

  (put 'deriv '+ deriv-sum))
