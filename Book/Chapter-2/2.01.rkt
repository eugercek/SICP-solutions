(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let* ((neg ((if negative? d) - +))
         (n (abs n))
         (d (abs d))
         (g (gcd n d)))
    (cons (neg (/ n g))
          (/ d g))))
