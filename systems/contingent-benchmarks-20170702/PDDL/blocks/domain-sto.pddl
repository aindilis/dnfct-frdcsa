(define (domain blocksworld)
(:predicates (clear ?x)
             (on-table ?x)
             (on ?x ?y)
		(true))


  (:action senseON
   :parameters (?b1 ?b2)
   :effect (and (on ?b1 ?b2) (true)))

  (:action senseCLEAR
   :parameters (?b1)
   :effect (and (clear ?b1) (true)))

  (:action senseONTABLE	
   :parameters (?b1)
   :effect (and (on-table ?b1) (true)))

(:action move-b-to-b
  :parameters (?bm ?bf ?bt)
  :precondition (and (clear ?bm) (clear ?bt) (on ?bm ?bf))
  :effect (and (not (clear ?bt)) (not (on ?bm ?bf))
               (on ?bm ?bt) (clear ?bf)))

(:action move-to-t
  :parameters (?b ?bf)
  :precondition (and (clear ?b) (on ?b ?bf))
  :effect (and (on-table ?b) (not (on ?b ?bf)) (clear ?bf)))

(:action move-t-to-b
  :parameters (?bm ?bt)
  :precondition (and (clear ?bm) (clear ?bt) (on-table ?bm))
  :effect (and (not (clear ?bt)) (not (on-table ?bm))
               (on ?bm ?bt))))

