(define (product term a b next)
  (define (iter x)
    (if (> x b)
        1
        (* (term x)
           (iter (next x)))))
  (iter a))

<<product>>
(define (factorial n)
  (product (lambda (x) x) 1 n inc))

(factorial 6)

<<product>>
(define  (approx-pi step) ;; One-based index
  (* 2.0
     (product (lambda (x)
                (let ((4n^2 (* 4 (* x x))))
                  (/ 4n^2
                     (- 4n^2 1))))
              1 step inc)))
(approx-pi 10)
(approx-pi 100)
(approx-pi 1000)

(define (product term a b next)
  (define (iter x acc) ;; acc -> accumulator
    (if (> x b)
        acc
        (iter (next x) (* (term x) acc))))
  (iter a 1))
