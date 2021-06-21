(define (split op1 op2)
  (lambda (painter n)
    (let ((small
           ((split op1 op2)
            painter (dec n))))
      (if (= painter 0)
        painter
        (op1 painter
             (op2 small
                  small))))))

(define right-split (split beside below))
(define up-split (split below beside))
