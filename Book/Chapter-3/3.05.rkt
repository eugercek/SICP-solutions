(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1)
                 trials-passed))))
  (iter trials 0))
 (define (random-in-range low high)
   (let ((range (- high low)))
     (+ low (* (random) range))))
(define (estimate-integral P x1 x2 y1 y2 trial)
  (let ((test (lambda ()
                (P (random-in-range x1 x2)
                   (random-in-range y1 y2))))
        (rect-area (abs (* (- x2 x1)
                          (- y2 y1)))))
    (* rect-area
       (monte-carlo trial test))))

;; (x-1)^2 + (y-1)^2 <= 1
(define (unit-circle x y) ; Kind of in-unit-circle?
  (define (square x) (* x x))
  (<= (+ (square x)
         (square y))
      1))

(estimate-integral unit-circle -1.0 1.0 -1.0 1.0 10000)
