(+ (begin (display "Left\n") 1)
   (begin (display "Right\n") 2))

(define f
  (let ((prev 0))
    (lambda (x)
      (let ((cur prev))
        (begin
          (set! prev x)
          cur)))))
(+ (f 0) (f 1))

<<f>>
(+ (f 1) (f 0))
