





(define (problem medicalPKS10)


(:domain medicalPKS10)


(:objects 
i0 i1 i2 i3 i4 i5 i6 i7 i8 i9 i10 - ILLNESS
s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - STAIN)
 (:init (and
 
 (stain s0)
 (not (dead))

(oneof (ill i1) (ill i2) (ill i3) (ill i4) (ill i5) (ill i6) (ill i7) (ill i8) (ill i9) (ill i10) )

))
 (:goal (and (ill i0) (not (dead)))))


