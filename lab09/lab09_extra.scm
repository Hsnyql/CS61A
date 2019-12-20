;; Extra Scheme Questions ;;


; Q5
(define lst
  (list (list 1) 2 (cons 3 4) 5)
)

; Q6
(define (composed f g)
  (lambda (a) (f (g a)))
)

; Q7
(define (remove item lst)
  (if (null? lst)
    '()
    (if (= item (car lst))
      (remove item (cdr lst))
      (cons (car lst) (remove item (cdr lst)))
    )
  )
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

; Q8
(define (no-repeats s)
  (if (null? s)
    '()
    (if (= 1 (length (filter (lambda (x) (= x (car s))) s)))
      (cons (car s) (no-repeats (cdr s)))
      (no-repeats (cdr s))
    )
  )
)

; Q9
(define (substitute s old new)
  (if (null? s)
    '()
    (if (eq? old (car s))
        (cons new (substitute (cdr s) old new))
        (if (pair? (car s))
          (cons (substitute (car s) old new) (substitute (cdr s) old new))
          (cons (car s) (substitute (cdr s) old new))
        )
    )
  )
)

; Q10
(define (sub-all s olds news)
  (if (null? s)
    s
    (if (null? olds)
      s
      (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news))
    )
  )
)