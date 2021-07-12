(define (same-parity base . l)
  (define (mod2 x) (remainder x 2))
  (define (iter l acc)
    (if (null? l)
        acc
        (iter (cdr l)
              (if (= (mod2 base) (mod2 (car l)))
                  (append acc (list (car l)))
                  acc))))
  (iter l (list base)))

(define (same-parity base . l)
  (define (same? x)
    (= (remainder base 2)
       (remainder x 2)))

  (define (iter l)
    (if (null? (cdr l)) ;; Saved 1 call with cdr :)))
        l
        (append (if (same? (car l))
                    (list (car l))
                    (list))
                (iter (cdr l)))))
  (cons base (iter l)))
(same-parity 1 2 3 4 5 6 7)

(list 1 2 3 (list) 4 5 6)
(append (list 1 2 3) (list) (list 4 5 6))
