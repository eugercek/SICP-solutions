(define (pascal n)
  "Draws n depth pascal triangle"
  (define (p-value row col)
    (cond
      ((or (= row 1)
           (= col 1)
           (= row col)) 1)
      (else
       (+ (p-value (- row 1) (- col 1))
          (p-value (- row 1) col)))))

  (define (n-times-i n func)
    (define (iter count)
      (cond ((= n count) 1) ;; Random value 1
            (else
             (func (+ 1 count)) ;; Pascal triangle uses 1-based index
             (iter (+ 1 count)))))
    (iter 0))

  (define (print-rows)
    (define (print-row row)
      (define (print-cols)
        (define (print-col col)
          (display (p-value row col))
          (display " "))
        (n-times-i row print-col))
      (n-times-i (- n row) (lambda (x) (display " ")))
      (print-cols) ;; Print all columns
      (display "\n"));; Then print a newline)
    (n-times-i n print-row))
  (print-rows))

(pascal 5)
