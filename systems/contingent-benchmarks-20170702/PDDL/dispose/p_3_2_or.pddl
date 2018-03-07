(define (problem dispose_3_2)
(:domain dispose)

 (:objects     o1
    o2

 - obj 
    p1_1
    p1_2
    p1_3
    p2_1
    p2_2
    p2_3
    p3_1
    p3_2
    p3_3

 - pos 
    )
   (:init
    (and
     (at p2_2)
     (trash_at p1_1)     (adj p1_1 p2_1)
     (adj p2_1 p1_1)

     (adj p1_2 p2_2)
     (adj p2_2 p1_2)

     (adj p1_3 p2_3)
     (adj p2_3 p1_3)

     (adj p2_1 p3_1)
     (adj p3_1 p2_1)

     (adj p2_2 p3_2)
     (adj p3_2 p2_2)

     (adj p2_3 p3_3)
     (adj p3_3 p2_3)


     (adj p1_1 p1_2)
     (adj p1_2 p1_1)

     (adj p2_1 p2_2)
     (adj p2_2 p2_1)

     (adj p3_1 p3_2)
     (adj p3_2 p3_1)

     (adj p1_2 p1_3)
     (adj p1_3 p1_2)

     (adj p2_2 p2_3)
     (adj p2_3 p2_2)

     (adj p3_2 p3_3)
     (adj p3_3 p3_2)


     (or
        (obj_at o1 p1_1)
        (obj_at o1 p1_2)
        (obj_at o1 p1_3)
        (obj_at o1 p2_1)
        (obj_at o1 p2_2)
        (obj_at o1 p2_3)
        (obj_at o1 p3_1)
        (obj_at o1 p3_2)
        (obj_at o1 p3_3)
     )
     (or
        (obj_at o2 p1_1)
        (obj_at o2 p1_2)
        (obj_at o2 p1_3)
        (obj_at o2 p2_1)
        (obj_at o2 p2_2)
        (obj_at o2 p2_3)
        (obj_at o2 p3_1)
        (obj_at o2 p3_2)
        (obj_at o2 p3_3)
     )

    )
    )
    (:goal (and     (disposed o1)
    (disposed o2)
)))
