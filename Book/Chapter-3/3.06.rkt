(define random-init 100)
(define (rand-update x) (+ x 1)) ; :D
(define rand
  (let ((x random-init))
    (define (generate)
      (set! x (rand-update x))
      x)
    (define (reset new)
      (set! x new)
      x)
    (define  (dispatch sym)
      (cond ((eq? sym 'generate) (generate))
            ((eq? sym 'reset) reset)
            (else (error "Invalid message"))))
    dispatch))

(rand 'generate)
((rand 'reset) 500)
(rand 'generate)
