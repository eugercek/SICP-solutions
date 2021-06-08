(define (deep-reverse l)
  (define (iter cur r)
    (if (null? cur)
        r
        (iter
         (cdr cur)
         (cons (if (pair? (car cur))
                   (deep-reverse (car cur))
                   (car cur))
               r))))
  (iter l (list)))

(define (deep-reverse l)
  (cond ((null? l) nil)
        ((not (pair? l)) l)
        (else
         (append
          (deep-reverse (cdr l))
          (list (deep-reverse (car l)))))))

(define (deep-reverse l)
  (reverse (map reverse l)))
