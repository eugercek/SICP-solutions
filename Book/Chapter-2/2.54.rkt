(define (remove elem seq)
  (if (eq? elem (car seq))
      (cdr seq)
      (cons (car seq)
            (remove elem (cdr seq)))))

(define (equal? l1 l2)
    (define (both fn item)
      (and (fn (item l1))
           (fn (item l2))))
    (define (one-of fn item)
      (or (fn (item l1))
          (fn (item l2))))

  (define (atom? x) (not (pair? x)))

  (define (id x) x)
  (cond
    ((both null? id) #t)
    ((one-of null? id) #f) ;; Cases like (equal? (list 1 2) '())
    ((both atom? car)
     (and (eq? (car l1)  ;; Could check both of them are number but
               (car l2)) ;; That don't look like scheme so i didn't
          (equal? (cdr l1)
                  (cdr l2))))
    ((one-of atom? id) #f) ;; Cases like (equal? (list 1 (list 2)) (list 1 2))
    ((both list? car) (equal? (car l1) (car l2)))))
