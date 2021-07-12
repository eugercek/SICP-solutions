(car ''abracadabra)

;; '(quote (a b c))
;; (list 'quote (list 'a  'b  'c))

(equal? (quote (a b c))
        (eval (list 'quote (list 'a 'b 'c)) (make-base-namespace)))
