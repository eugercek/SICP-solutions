<<acc>>
(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))
(fold-right / 1 (list 1 2 3))

<<fold>>
(fold-left / 1 (list 1 2 3))

<<fold>>
(fold-right list nil (list 1 2 3))
(fold-left list nil (list 1 2 3))

<<fold>>
(fold-right + 0 (list 1 2 3))
(fold-left + 0 (list 1 2 3))

(define (my/fold-left op initial seq)
  (if (null? seq)
      initial
      (op (my/fold-left op initial (cdr seq))
          (car seq))))

(my/fold-left + 0 (list 1 2 3))
