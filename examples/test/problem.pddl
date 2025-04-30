;; Problem definition
(define (problem stack-blocks)
  (:domain blocks)
  (:objects a b c)
  (:init ;; All three on table, hand empty. No stacking initially
    (ontable a) 
    (ontable b) 
    (ontable c) 
    (clear a) 
    (clear b) 
    (clear c) 
    (handempty)
  )
  (:goal 
    (and 
      (on a b) ; Put a on top of b
      (on b c) ; Put b on top of c
    )
  )
)