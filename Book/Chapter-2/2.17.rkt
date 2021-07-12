(define (last-pair elements)
  (if (null? (cdr elements))
      elements
      (last-pair (cdr elements))))

(last-pair (list 1 2 3 4 5))
