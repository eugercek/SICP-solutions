<<dot>>
(define (matrix-*-vector m v)
   (map (lambda (m-row) (dot-product m-row v))
        m))

<<mv>>
(matrix-*-vector m1 v1)

<<dot>>
<<rand-data>>
(map car m1)
(map cadr m1)
(map caddr m1)

(define (transpose m)
  (if (null? m)
      m
      (cons (map car m)
            (transpose (map cdr m)))))
(transpose m1)

<<dot>>
<<rand-data>>
(define (transpose m)
  (if (null? (car m))
      (list)
      (cons (map car m)
            (transpose (map cdr m)))))

(transpose m1)

<<dot>>
<<rand-data>>
(define (transpose m)
  (accumulate-n cons (list) m))

<<trans>>

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map
     (lambda (row)
       (map (lambda (col)
              (dot-product row col))
            cols))
       m)))

<<mv>>
(define (transpose m)
  (accumulate-n cons (list) m))

(define (matrix-*-matrix m n)
  (transpose
   (map
    (lambda (col)
      (matrix-*-vector m col))
    (transpose n))))

(matrix-*-matrix m1 m2)
