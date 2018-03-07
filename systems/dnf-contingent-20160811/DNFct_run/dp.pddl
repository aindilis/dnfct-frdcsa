
(define (domain logistics_conf)
  (:types OBJ TRUCK LOCATION AIRPLANE CITY AIRPORT )
  (:predicates 	(at_tl ?obj - TRUCK  ?loc - LOCATION)
		(at_ta ?obj - TRUCK  ?loc - AIRPORT)
		(at_aa ?obj - AIRPLANE ?loc - AIRPORT)
		(at_ol ?obj - OBJ ?loc - LOCATION)
		(at_oa ?obj - OBJ ?loc - AIRPORT)
		(in_ot ?obj1 - OBJ ?obj2 - TRUCK)
		(in_oa ?obj1 - OBJ ?obj2 - AIRPLANE)
		(in_city_l ?loc - LOCATION ?city - CITY)
		(in_city_a ?loc - AIRPORT ?city - CITY)
		(in_city_t ?loc - TRUCK ?city - CITY)
		(true))

 
(:action sense_package_loc_t
 :parameters (?obj - OBJ ?loc - LOCATION ?truck - TRUCK)
 :precondition (at_tl ?truck ?loc)
 :effect (and (at_ol ?obj ?loc) (true)))

(:action sense_package_ap_t
 :parameters (?obj - OBJ ?loc - AIRPORT ?truck - TRUCK)
 :precondition (at_ta ?truck ?loc)
 :effect (and (at_oa ?obj ?loc) (true)))

(:action sense_package_ap_a
 :parameters (?obj - OBJ ?loc - AIRPORT ?airplane - AIRPLANE)
 :precondition (at_aa ?airplane ?loc)
 :effect (and (at_oa ?obj ?loc) (true)))


(:action LOAD_TRUCK_LOC
  :parameters
   (?obj - OBJ
    ?truck - TRUCK
    ?loc - LOCATION 
    ?city - CITY)
  :precondition
   (and 
	(at_tl ?truck ?loc) 
 	(in_city_t ?truck ?city)
	(in_city_l ?loc ?city)
  	(at_ol ?obj ?loc)
   )
  :effect
   (and (not (at_ol ?obj ?loc)) 
	  (in_ot ?obj ?truck)))

(:action LOAD_TRUCK_AP
  :parameters
   (?obj - OBJ
    ?truck - TRUCK
    ?loc - AIRPORT
    ?city - CITY)
  :precondition
   (and 
	(at_ta ?truck ?loc) 
 	(in_city_t ?truck ?city)
	(in_city_a ?loc ?city)
	(at_oa ?obj ?loc) 
  
   )
  :effect (and (not (at_oa ?obj ?loc)) 
	  (in_ot ?obj ?truck)))

(:action LOAD_AIRPLANE
  :parameters
   (?obj - OBJ ?airplane - AIRPLANE ?loc - AIRPORT) 
  :precondition
   (and (at_aa ?airplane ?loc) (at_oa ?obj ?loc))
  :effect
   (and (not (at_oa ?obj ?loc)) 
              (in_oa ?obj ?airplane)))

(:action UNLOAD_TRUCK_LOC
  :parameters
   (?obj - OBJ
    ?truck - TRUCK
    ?loc - LOCATION
    ?city - CITY)
  :precondition
   (and 
	(at_tl ?truck ?loc) 
	(in_city_t ?truck ?city)
	(in_city_l ?loc ?city)
        ;(not (at_ol ?obj ?loc))
   )
  :effect
   (when (in_ot ?obj ?truck) 
	 (and (not (in_ot ?obj ?truck)) 
              (at_ol ?obj ?loc))))

(:action UNLOAD_TRUCK_AP
  :parameters
   (?obj - OBJ
    ?truck - TRUCK
    ?loc - AIRPORT
    ?city - CITY)
  :precondition
   (and 
	(at_ta ?truck ?loc) 
	(in_city_t ?truck ?city)
	(in_city_a ?loc ?city)
        ;(not (at_ol ?obj ?loc))
   )
  :effect
   (when (in_ot ?obj ?truck) 
	 (and (not (in_ot ?obj ?truck)) 
              (at_oa ?obj ?loc))))

(:action UNLOAD_AIRPLANE
  :parameters
   (?obj - OBJ
    ?airplane - AIRPLANE
    ?loc - AIRPORT)
  :precondition
   (at_aa ?airplane ?loc)	
  :effect
   (when (in_oa ?obj ?airplane)   
	 (and (not (in_oa ?obj ?airplane)) 
              (at_oa ?obj ?loc))))

(:action DRIVE_TRUCK_LOC_AP
  :parameters
   (?truck - TRUCK
    ?loc1 - LOCATION
    ?loc2 - AIRPORT
    ?city - CITY)
  :precondition
   (and (at_tl ?truck ?loc1)
        (in_city_l ?loc1 ?city)
        (in_city_a ?loc2 ?city)
	(in_city_t ?truck ?city)
	;(not (at_ta ?truck ?loc2))
   )
  :effect
   (and (not (at_tl ?truck ?loc1)) 
        (at_ta ?truck ?loc2)))

(:action DRIVE_TRUCK_AP_LOC
  :parameters
   (?truck - TRUCK
    ?loc1 - AIRPORT
    ?loc2 - LOCATION 
    ?city - CITY)
    :precondition
   (and (at_ta ?truck ?loc1)
        (in_city_a ?loc1 ?city)
        (in_city_l ?loc2 ?city)
	(in_city_t ?truck ?city)
	;(not (at_tl ?truck ?loc2))
   )
  :effect
   (and (not (at_ta ?truck ?loc1)) 
        (at_tl ?truck ?loc2)))

(:action FLY_AIRPLANE
  :parameters
   (?airplane - AIRPLANE
    ?loc1 - AIRPORT
    ?loc2 - AIRPORT)
  :precondition
  (and  
	(at_aa ?airplane ?loc1)
	;(not (at ?airplane ?loc2) 
  )
  :effect
   (and (not (at_aa ?airplane ?loc1) )
        (at_aa ?airplane ?loc2 )))
)




 



(define (problem logistics-c5-s5-p5-a1)
(:domain logistics_conf)
(:objects a0 
 - AIRPLANE
          c0 c1 c2 c3 c4 
 - CITY
          t0 t1 t2 t3 t4 
 - TRUCK
          l01 l02 l03 l04 l11 l12 l13 l14 l21 l22 l23 l24 l31 l32 l33 l34 l41 l42 l43 l44 
 - LOCATION
          l00 l10 l20 l30 l40 
 - AIRPORT
          p0 p1 p2 p3 p4 
 - OBJ
)
(:init (and
(in_city_a  l00 c0)
(in_city_l  l01 c0)
(in_city_l  l02 c0)
(in_city_l  l03 c0)
(in_city_l  l04 c0)
(in_city_a  l10 c1)
(in_city_l  l11 c1)
(in_city_l  l12 c1)
(in_city_l  l13 c1)
(in_city_l  l14 c1)
(in_city_a  l20 c2)
(in_city_l  l21 c2)
(in_city_l  l22 c2)
(in_city_l  l23 c2)
(in_city_l  l24 c2)
(in_city_a  l30 c3)
(in_city_l  l31 c3)
(in_city_l  l32 c3)
(in_city_l  l33 c3)
(in_city_l  l34 c3)
(in_city_a  l40 c4)
(in_city_l  l41 c4)
(in_city_l  l42 c4)
(in_city_l  l43 c4)
(in_city_l  l44 c4)
(in_city_t t0 c0)
(at_tl t0 l03)
(in_city_t t1 c1)
(at_tl t1 l11)
(in_city_t t2 c2)
(at_tl t2 l22)
(in_city_t t3 c3)
(at_ta t3 l30)
(in_city_t t4 c4)
(at_tl t4 l43)
(at_aa a0 l00)

(oneof
   (at_oa p0 l00)
   (at_ol p0 l01)
   (at_ol p0 l02)
   (at_ol p0 l03)
   (at_ol p0 l04)
)

(oneof
   (at_oa p1 l20)
   (at_ol p1 l21)
   (at_ol p1 l22)
   (at_ol p1 l23)
   (at_ol p1 l24)
)

(oneof
   (at_oa p2 l10)
   (at_ol p2 l11)
   (at_ol p2 l12)
   (at_ol p2 l13)
   (at_ol p2 l14)
)

(oneof
   (at_oa p3 l20)
   (at_ol p3 l21)
   (at_ol p3 l22)
   (at_ol p3 l23)
   (at_ol p3 l24)
)

(oneof
   (at_oa p4 l40)
   (at_ol p4 l41)
   (at_ol p4 l42)
   (at_ol p4 l43)
   (at_ol p4 l44)
)
))
(:goal
(and
(at_oa p0 l10)
(at_ol p1 l12)
(at_ol p2 l11)
(at_ol p3 l32)
(at_ol p4 l42)
)
)
)


