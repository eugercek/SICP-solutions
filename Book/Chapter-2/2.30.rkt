<<sq>>
(define (square-tree t)
  (cond
    ((null? t) t)
    ((not (pair? t)) (square t))
    (else
     (cons (square-tree (car t))
        (square-tree (cdr t))))))

<<sq>>
(define (square-tree t)
  (map (lambda (sub-t)
         (if (pair? sub-t)
             (square-tree sub-t)
             (square sub-t)))
       t))
(square-tree (list 1 2 (list 3 4)))
