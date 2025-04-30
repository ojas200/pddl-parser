;; Domain 
(define (domain blocks)
  (:requirements :strips) ;Requirements STRIPS from example
  (:predicates ;specific information about the world I am interested in
    (on ?x ?y) ;Is the block x on top of block y 
    (ontable ?x) ;Is the block x on the table(directly)
    (clear ?x)  ;Is top surface of block clear
    (handempty) ;Is robot hand empty?
    (holding ?x) ;Is the robot hand holding block x
  )

  (:action pick-up ;If robot hand is empty, block has nothing on top, and block is on the table 
    :parameters (?x) ;CHECK WITHOUT ontable
    :precondition (and (clear ?x) (ontable ?x) (handempty))
    :effect (and (not (ontable ?x)) (not (clear ?x)) (not (handempty)) (holding ?x))
  )

  (:action put-down ;If block is in hand, place it down. Now hand is empty, block is on the table and has nothing on top of it
    :parameters (?x)
    :precondition (holding ?x)
    :effect (and (not (holding ?x)) (clear ?x) (handempty) (ontable ?x))
  )

  (:action stack ;Put x on top of y. y must be on table and clear, x must be in hand.
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (not (holding ?x)) (not (clear ?y)) (clear ?x) (handempty) (on ?x ?y))
  )

  (:action unstack ;Remove x from top of y. Hand must be free, x must be clear and on top of y. 
    :parameters (?x ?y)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and (holding ?x) (clear ?y) (not (clear ?x)) (not (handempty)) (not (on ?x ?y)))
  )
)