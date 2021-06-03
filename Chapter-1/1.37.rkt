(define (cont-frac N D k)
  (define (iter i)
    (if (> i k)
        0
        (/ (N i)
           (+ (D i)
              (iter (inc i))))))
  (iter 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0) 10)

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0) 11)

(define (cont-frac N D k)
  (define (iter i acc)
    (if (= i 0)
        acc
        (iter (dec i)
              (/ (N i)
                 (+ (D i) acc)))))
  (iter k 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0) 10)

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0) 11)
