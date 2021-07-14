(define (adjoin-set x set)
  (if (null? set)
      (list x)
      (let ((el (car set)))
        (cond
          ((= el x) set)
          ((< el x) (cons el (adjoin-set x (cdr set))))
          (else (cons x set))))))

(adjoin-set 5 (list 1 2 3))
(adjoin-set 2 (list 1 2 3))
(adjoin-set 0 (list 1 2 3))
