(define (make-mobile left right) ;; left-branch and right-branch
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

<<makes>>
<<sels>>
(define (total-weight m)
  (cond ((null? m) 0)
        ((not (pair? m)) m)
        (else
         (+ (total-weight (branch-structure (left-branch m)))
            (total-weight (branch-structure (right-branch m)))))))

<<wei>>
(define (balanced? m)
  (cond
    ((null? m) #t)
    ((not (pair? m)) #t) ;; No need to look a weight's left, right branches and its children because
    ;; There are none
    (else
     (and (= (torque (left-branch m))
             (torque (right-branch m)))
          (balanced? (branch-structure (left-branch m)))
          (balanced? (branch-structure (right-branch m)))))))

(define (torque b)
  (* (branch-length b) (total-weight (branch-structure b))))

(define (right-branch mobile)
  (cdr mobile))
(define (branch-structure branch)
  (cdr branch))
