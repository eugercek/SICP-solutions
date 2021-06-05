<<point>>
<<segment>>
<<compose>>
<<square>>

(define (make-rect p1 p2 p3 p4)
  ;; p1 ----seg1----- p2
  ;;  |               |
  ;;  s               s
  ;;  e               e
  ;;  g               g
  ;;  3               4
  ;;  |               |
  ;; p3 ----seg2----- p4
  (cons (cons p1 p2)
        (cons p3 p4)))

(define (p1-rect r)
 (car (car r)))

(define (p2-rect r)
 (cdr (car r)))

(define (p3-rect r)
 (car (cdr r)))

(define (p4-rect r)
 (cdr (car r)))

(define (h-rect r)
  (distance (p1-rect r)
            (p3-rect r)))
(define (w-rect r)
  (distance (p1-rect r)
            (p2-rect r)))

(define (distance p1 p2)
  (sqrt
   (+ (square
       (- (x-point p1 ) (x-point p2)))
      (square
       (- (y-point p1 ) (y-point p2))))))

(define (perimiter-rect r)
  (* 2
     (+ (h-rect r)
        (w-rect r))))

(define (area-rect r)
  (* (h-rect r)
     (w-rect r)))

<<method-1>>
(define p1 (make-point 0 4))
(define p2 (make-point 3 4))
(define p3 (make-point 0 0))
(define p4 (make-point 3 0))

(define r (make-rect p1 p2 p3 p4))

(perimiter-rect r)
(area-rect r)
r

<<point>>
<<segment>>
<<compose>>
<<square>>

(define (make-rect lb h w) ;; left-botton height widht
  (cons lb
        (cons h w)))

(define (h-rect r)
  (car (cdr r)))
(define (w-rect r)
  (cdr (cdr r)))

(define (perimiter-rect r)
  (* 2
     (+ (h-rect r)
        (w-rect r))))

(define (area-rect r)
  (* (h-rect r)
     (w-rect r)))

<<method-2>>
(define p1 (make-point 0 0))
(define r (make-rect p1 4 3))

(perimiter-rect r)
(area-rect r)
