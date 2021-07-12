<<sq>>
(define (treemap fn t)
  (map (lambda (sub-t)
         (if (pair? sub-t)
             (treemap fn sub-t)
             (fn sub-t))
         ) t))

(define (square-tree t)
  (treemap square t))

(square-tree (list (list 1 2) (list 3 4) 5))
