(define (reverse elements)
  (define (iter l result)
    (if (null? l)
        result
        (iter (cdr l) (cons (car l) result))))
  (iter elements (list )))

(reverse (list 1 2 3))

(define (reverse l)
  (if (null? (cdr l))
      l
      (append (reverse (cdr l))
                       (car l))))

(reverse (list 1 2))

(define (reverse l)
  (if (null? (cdr l))
      l
      (append (reverse (cdr l))
                       (list (car l)))))

(reverse (list 1 2 3 4))
