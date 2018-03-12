;; see if we can add one of dice_roll d4 (1 2 3 4)
;; see if we can add one of dice_roll d6 (1 2 3 4 5 6)
;; see if we can add one of dice_roll d8 (1 2 3 4 5 6 7 8)
;; see if we can add one of dice_roll d10 (1 2 3 4 5 6 7 8 9 10)
;; see if we can add one of dice_roll d12 (1 2 3 4 5 6 7 8 9 10 11 12)
;; see if we can add one of dice_roll d20 (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)

;; sensing action, fail if roll not above valid threshold for such

(define (domain indigent_logistics_1)
 (:types PERSON OBJECT LOCATION)
 (:predicates
  (at_pl ?person - PERSON  ?location - LOCATION)
  (at_ol ?object - OBJECT ?location - LOCATION)
  (in_ol ?object - OBJECT ?location - LOCATION)
  (in_op ?object - OBJECT ?person - PERSON)
  (true)
  )
 
 (:action sense_object_t
  :parameters (?object - OBJECT ?location - LOCATION ?person - PERSON)
  :precondition (at_pl ?person ?location)
  :effect (and (at_ol ?object ?location) (true)))

 (:action EAT
  :parameters
  (?person - PERSON
   ?object - OBJECT
   ?location - LOCATION
   )
  :precondition
  (and 
   (at_pl ?person ?location)
   (at_ol ?object ?location) 
   )
  :effect
  (and
   (not (at_ol ?object ?location)) 
   (in_op ?object ?person)
   )
  )

 (:action MOVE
  :parameters
  (?person - PERSON
   ?loc1 ?loc2 - LOCATION
   )
  :precondition
  (and
   (at_pl ?person ?loc1)
   )
  :effect
  (and
   (not (at_pl ?person ?loc1)) 
   (at_pl ?person ?loc2)
   )
  )
 )
