(define (make-account balance passwd)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (passwd-error arg)             ; Need arg because dispatched procedure takes argument
    "Incorrect password")

  (define (dispatch *** m)              ; Because passwords look like *** , lisp joke
    (cond ((not  (eq? *** passwd)) passwd-error)
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: MAKE-ACCOUNT"
                       m))))
  dispatch)

(define (make-joint main m-p n-p)
  (lambda (*** message)
    (if (eq? *** n-p)
        (main m-p message)
        (error "Wrong new account password!"))))

(define peter-acc (make-account 100 'p))
((peter-acc 'p 'withdraw) 40)
((peter-acc 'wrong 'deposit) 50)
(define paul-acc (make-joint peter-acc 'p 'new-p))
((paul-acc 'new-p 'withdraw) 20)
