(define (install-exponent-package)
  ;; internal procedures
  (define (variable? x) (symbol? x))
  (define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))
  (define (=number? exp num) (and (number? exp) (= exp num)))

  (define (product? x) (and (pair? x) (eq? (car x) '*)))
  (define (multiplier p) (cadr p))
  (define (multiplicand p) (caddr p))

  (define (exponentiation? exp)
    (and (pair? exp) (eq? (car exp) '**)
         (variable? (cadr exp))
         (number? (caddr exp))))

  (define (base e) (cadr e))
  (define (exponent e) (caddr e))

  (define (make-exponentiation b e)
    (cond
      ((= e 0) 1)
      ((= e 1) b)
      (else
       (list '** b e))))
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))


  ;; interface to the rest of the system
  (define (deriv-exponent args)
    (make-product (exponent exp)
                  (make-product
                   (make-exponentiation (base exp)
                                        (- (exponent exp) 1))
                   (deriv (base exp) var))))

  (put 'deriv '** deriv-exponent))
