
:- use_module(library(lists)).
:- dynamic executable/2.
:- dynamic cpa_executable/2.
:- dynamic causes/3.
:- dynamic cpa_causes/3.
:- dynamic cpa_initially/1.

%%%% Objects %%%%
cpa_airplane(cpa_a0).
cpa_city(cpa_c0).
cpa_city(cpa_c1).
cpa_city(cpa_c2).
cpa_city(cpa_c3).
cpa_city(cpa_c4).
cpa_truck(cpa_t0).
cpa_truck(cpa_t1).
cpa_truck(cpa_t2).
cpa_truck(cpa_t3).
cpa_truck(cpa_t4).
cpa_location(cpa_l01).
cpa_location(cpa_l02).
cpa_location(cpa_l03).
cpa_location(cpa_l04).
cpa_location(cpa_l11).
cpa_location(cpa_l12).
cpa_location(cpa_l13).
cpa_location(cpa_l14).
cpa_location(cpa_l21).
cpa_location(cpa_l22).
cpa_location(cpa_l23).
cpa_location(cpa_l24).
cpa_location(cpa_l31).
cpa_location(cpa_l32).
cpa_location(cpa_l33).
cpa_location(cpa_l34).
cpa_location(cpa_l41).
cpa_location(cpa_l42).
cpa_location(cpa_l43).
cpa_location(cpa_l44).
cpa_airport(cpa_l00).
cpa_airport(cpa_l10).
cpa_airport(cpa_l20).
cpa_airport(cpa_l30).
cpa_airport(cpa_l40).
cpa_obj(cpa_p0).
cpa_obj(cpa_p1).
cpa_obj(cpa_p2).
cpa_obj(cpa_p3).
cpa_obj(cpa_p4).

%%%% Constants %%%%

%%%%  Types rules %%%%

%%%% Predicates %%%%
fluent(cpa_at_tl(  OBJ,  LOC)):-
	cpa_truck( OBJ), cpa_location( LOC).

fluent(cpa_at_ta(  OBJ,  LOC)):-
	cpa_truck( OBJ), cpa_airport( LOC).

fluent(cpa_at_aa(  OBJ,  LOC)):-
	cpa_airplane( OBJ), cpa_airport( LOC).

fluent(cpa_at_ol(  OBJ,  LOC)):-
	cpa_obj( OBJ), cpa_location( LOC).

fluent(cpa_at_oa(  OBJ,  LOC)):-
	cpa_obj( OBJ), cpa_airport( LOC).

fluent(cpa_in_ot(  OBJ1,  OBJ2)):-
	cpa_obj( OBJ1), cpa_truck( OBJ2).

fluent(cpa_in_oa(  OBJ1,  OBJ2)):-
	cpa_obj( OBJ1), cpa_airplane( OBJ2).

fluent(cpa_in_city_l(  LOC,  CITY)):-
	cpa_location( LOC), cpa_city( CITY).

fluent(cpa_in_city_a(  LOC,  CITY)):-
	cpa_airport( LOC), cpa_city( CITY).

fluent(cpa_in_city_t(  LOC,  CITY)):-
	cpa_truck( LOC), cpa_city( CITY).

fluent(cpa_true).


%%%% Actions %%%%
action(cpa_sense_package_loc_t(  OBJ,  LOC,  TRUCK)):-
	cpa_obj( OBJ), cpa_location( LOC), cpa_truck( TRUCK).

action(cpa_sense_package_ap_t(  OBJ,  LOC,  TRUCK)):-
	cpa_obj( OBJ), cpa_airport( LOC), cpa_truck( TRUCK).

action(cpa_sense_package_ap_a(  OBJ,  LOC,  AIRPLANE)):-
	cpa_obj( OBJ), cpa_airport( LOC), cpa_airplane( AIRPLANE).

action(cpa_load_truck_loc(  OBJ,  TRUCK,  LOC,  CITY)):-
	cpa_obj( OBJ), cpa_truck( TRUCK), cpa_location( LOC), cpa_city( CITY).

action(cpa_load_truck_ap(  OBJ,  TRUCK,  LOC,  CITY)):-
	cpa_obj( OBJ), cpa_truck( TRUCK), cpa_airport( LOC), cpa_city( CITY).

action(cpa_load_airplane(  OBJ,  AIRPLANE,  LOC)):-
	cpa_obj( OBJ), cpa_airplane( AIRPLANE), cpa_airport( LOC).

action(cpa_unload_truck_loc(  OBJ,  TRUCK,  LOC,  CITY)):-
	cpa_obj( OBJ), cpa_truck( TRUCK), cpa_location( LOC), cpa_city( CITY).

action(cpa_unload_truck_ap(  OBJ,  TRUCK,  LOC,  CITY)):-
	cpa_obj( OBJ), cpa_truck( TRUCK), cpa_airport( LOC), cpa_city( CITY).

action(cpa_unload_airplane(  OBJ,  AIRPLANE,  LOC)):-
	cpa_obj( OBJ), cpa_airplane( AIRPLANE), cpa_airport( LOC).

action(cpa_drive_truck_loc_ap(  TRUCK,  LOC1,  LOC2,  CITY)):-
	cpa_truck( TRUCK), cpa_location( LOC1), cpa_airport( LOC2), cpa_city( CITY).

action(cpa_drive_truck_ap_loc(  TRUCK,  LOC1,  LOC2,  CITY)):-
	cpa_truck( TRUCK), cpa_airport( LOC1), cpa_location( LOC2), cpa_city( CITY).

action(cpa_fly_airplane(  AIRPLANE,  LOC1,  LOC2)):-
	cpa_airplane( AIRPLANE), cpa_airport( LOC1), cpa_airport( LOC2).


%%%% Preconditions %%%%
executable(cpa_sense_package_loc_t(  OBJ,  LOC,  TRUCK), [
cpa_at_tl( TRUCK,  LOC) ]):-
	cpa_obj( OBJ), cpa_location( LOC), cpa_truck( TRUCK).

executable(cpa_sense_package_ap_t(  OBJ,  LOC,  TRUCK), [
cpa_at_ta( TRUCK,  LOC) ]):-
	cpa_obj( OBJ), cpa_airport( LOC), cpa_truck( TRUCK).

executable(cpa_sense_package_ap_a(  OBJ,  LOC,  AIRPLANE), [
cpa_at_aa( AIRPLANE,  LOC) ]):-
	cpa_obj( OBJ), cpa_airport( LOC), cpa_airplane( AIRPLANE).

executable(cpa_load_truck_loc(  OBJ,  TRUCK,  LOC,  CITY), [
cpa_and( cpa_and( cpa_and( cpa_and( cpa_at_tl( TRUCK,  LOC)), cpa_in_city_t( TRUCK,  CITY)), cpa_in_city_l( LOC,  CITY)), cpa_at_ol( OBJ,  LOC)) ]):-
	cpa_obj( OBJ), cpa_truck( TRUCK), cpa_location( LOC), cpa_city( CITY).

executable(cpa_load_truck_ap(  OBJ,  TRUCK,  LOC,  CITY), [
cpa_and( cpa_and( cpa_and( cpa_and( cpa_at_ta( TRUCK,  LOC)), cpa_in_city_t( TRUCK,  CITY)), cpa_in_city_a( LOC,  CITY)), cpa_at_oa( OBJ,  LOC)) ]):-
	cpa_obj( OBJ), cpa_truck( TRUCK), cpa_airport( LOC), cpa_city( CITY).

executable(cpa_load_airplane(  OBJ,  AIRPLANE,  LOC), [
cpa_and( cpa_and( cpa_at_aa( AIRPLANE,  LOC)), cpa_at_oa( OBJ,  LOC)) ]):-
	cpa_obj( OBJ), cpa_airplane( AIRPLANE), cpa_airport( LOC).

executable(cpa_unload_truck_loc(  OBJ,  TRUCK,  LOC,  CITY), [
cpa_and( cpa_and( cpa_and( cpa_at_tl( TRUCK,  LOC)), cpa_in_city_t( TRUCK,  CITY)), cpa_in_city_l( LOC,  CITY)) ]):-
	cpa_obj( OBJ), cpa_truck( TRUCK), cpa_location( LOC), cpa_city( CITY).

executable(cpa_unload_truck_ap(  OBJ,  TRUCK,  LOC,  CITY), [
cpa_and( cpa_and( cpa_and( cpa_at_ta( TRUCK,  LOC)), cpa_in_city_t( TRUCK,  CITY)), cpa_in_city_a( LOC,  CITY)) ]):-
	cpa_obj( OBJ), cpa_truck( TRUCK), cpa_airport( LOC), cpa_city( CITY).

executable(cpa_unload_airplane(  OBJ,  AIRPLANE,  LOC), [
cpa_at_aa( AIRPLANE,  LOC) ]):-
	cpa_obj( OBJ), cpa_airplane( AIRPLANE), cpa_airport( LOC).

executable(cpa_drive_truck_loc_ap(  TRUCK,  LOC1,  LOC2,  CITY), [
cpa_and( cpa_and( cpa_and( cpa_and( cpa_at_tl( TRUCK,  LOC1)), cpa_in_city_l( LOC1,  CITY)), cpa_in_city_a( LOC2,  CITY)), cpa_in_city_t( TRUCK,  CITY)) ]):-
	cpa_truck( TRUCK), cpa_location( LOC1), cpa_airport( LOC2), cpa_city( CITY).

executable(cpa_drive_truck_ap_loc(  TRUCK,  LOC1,  LOC2,  CITY), [
cpa_and( cpa_and( cpa_and( cpa_and( cpa_at_ta( TRUCK,  LOC1)), cpa_in_city_a( LOC1,  CITY)), cpa_in_city_l( LOC2,  CITY)), cpa_in_city_t( TRUCK,  CITY)) ]):-
	cpa_truck( TRUCK), cpa_airport( LOC1), cpa_location( LOC2), cpa_city( CITY).

executable(cpa_fly_airplane(  AIRPLANE,  LOC1,  LOC2), [
cpa_and( cpa_at_aa( AIRPLANE,  LOC1)) ]):-
	cpa_airplane( AIRPLANE), cpa_airport( LOC1), cpa_airport( LOC2).


%%%% Effects %%%%
causes(cpa_sense_package_loc_t(  OBJ,  LOC,  TRUCK), [
cpa_and( cpa_and( cpa_at_ol( OBJ,  LOC)), cpa_true) ], 
[]):-
	cpa_obj( OBJ), cpa_location( LOC), cpa_truck( TRUCK).

causes(cpa_sense_package_ap_t(  OBJ,  LOC,  TRUCK), [
cpa_and( cpa_and( cpa_at_oa( OBJ,  LOC)), cpa_true) ], 
[]):-
	cpa_obj( OBJ), cpa_airport( LOC), cpa_truck( TRUCK).

causes(cpa_sense_package_ap_a(  OBJ,  LOC,  AIRPLANE), [
cpa_and( cpa_and( cpa_at_oa( OBJ,  LOC)), cpa_true) ], 
[]):-
	cpa_obj( OBJ), cpa_airport( LOC), cpa_airplane( AIRPLANE).

causes(cpa_load_truck_loc(  OBJ,  TRUCK,  LOC,  CITY), [
cpa_and( cpa_and( neg(cpa_at_ol( OBJ,  LOC))), cpa_in_ot( OBJ,  TRUCK)) ], 
[]):-
	cpa_obj( OBJ), cpa_truck( TRUCK), cpa_location( LOC), cpa_city( CITY).

causes(cpa_load_truck_ap(  OBJ,  TRUCK,  LOC,  CITY), [
cpa_and( cpa_and( neg(cpa_at_oa( OBJ,  LOC))), cpa_in_ot( OBJ,  TRUCK)) ], 
[]):-
	cpa_obj( OBJ), cpa_truck( TRUCK), cpa_airport( LOC), cpa_city( CITY).

causes(cpa_load_airplane(  OBJ,  AIRPLANE,  LOC), [
cpa_and( cpa_and( neg(cpa_at_oa( OBJ,  LOC))), cpa_in_oa( OBJ,  AIRPLANE)) ], 
[]):-
	cpa_obj( OBJ), cpa_airplane( AIRPLANE), cpa_airport( LOC).

causes(cpa_unload_truck_loc(  OBJ,  TRUCK,  LOC,  CITY), [
cpa_when( cpa_in_ot( OBJ,  TRUCK), cpa_and( neg(cpa_in_ot( OBJ,  TRUCK)), cpa_and( cpa_at_ol( OBJ,  LOC)))) ], 
[]):-
	cpa_obj( OBJ), cpa_truck( TRUCK), cpa_location( LOC), cpa_city( CITY).

causes(cpa_unload_truck_ap(  OBJ,  TRUCK,  LOC,  CITY), [
cpa_when( cpa_in_ot( OBJ,  TRUCK), cpa_and( neg(cpa_in_ot( OBJ,  TRUCK)), cpa_and( cpa_at_oa( OBJ,  LOC)))) ], 
[]):-
	cpa_obj( OBJ), cpa_truck( TRUCK), cpa_airport( LOC), cpa_city( CITY).

causes(cpa_unload_airplane(  OBJ,  AIRPLANE,  LOC), [
cpa_when( cpa_in_oa( OBJ,  AIRPLANE), cpa_and( neg(cpa_in_oa( OBJ,  AIRPLANE)), cpa_and( cpa_at_oa( OBJ,  LOC)))) ], 
[]):-
	cpa_obj( OBJ), cpa_airplane( AIRPLANE), cpa_airport( LOC).

causes(cpa_drive_truck_loc_ap(  TRUCK,  LOC1,  LOC2,  CITY), [
cpa_and( cpa_and( neg(cpa_at_tl( TRUCK,  LOC1))), cpa_at_ta( TRUCK,  LOC2)) ], 
[]):-
	cpa_truck( TRUCK), cpa_location( LOC1), cpa_airport( LOC2), cpa_city( CITY).

causes(cpa_drive_truck_ap_loc(  TRUCK,  LOC1,  LOC2,  CITY), [
cpa_and( cpa_and( neg(cpa_at_ta( TRUCK,  LOC1))), cpa_at_tl( TRUCK,  LOC2)) ], 
[]):-
	cpa_truck( TRUCK), cpa_airport( LOC1), cpa_location( LOC2), cpa_city( CITY).

causes(cpa_fly_airplane(  AIRPLANE,  LOC1,  LOC2), [
cpa_and( cpa_and( neg(cpa_at_aa( AIRPLANE,  LOC1))), cpa_at_aa( AIRPLANE,  LOC2)) ], 
[]):-
	cpa_airplane( AIRPLANE), cpa_airport( LOC1), cpa_airport( LOC2).


%%%% Inits %%%%
cpa_initially(cpa_in_city_a(cpa_l00, cpa_c0)).
cpa_initially(cpa_in_city_l(cpa_l01, cpa_c0)).
cpa_initially(cpa_in_city_l(cpa_l02, cpa_c0)).
cpa_initially(cpa_in_city_l(cpa_l03, cpa_c0)).
cpa_initially(cpa_in_city_l(cpa_l04, cpa_c0)).
cpa_initially(cpa_in_city_a(cpa_l10, cpa_c1)).
cpa_initially(cpa_in_city_l(cpa_l11, cpa_c1)).
cpa_initially(cpa_in_city_l(cpa_l12, cpa_c1)).
cpa_initially(cpa_in_city_l(cpa_l13, cpa_c1)).
cpa_initially(cpa_in_city_l(cpa_l14, cpa_c1)).
cpa_initially(cpa_in_city_a(cpa_l20, cpa_c2)).
cpa_initially(cpa_in_city_l(cpa_l21, cpa_c2)).
cpa_initially(cpa_in_city_l(cpa_l22, cpa_c2)).
cpa_initially(cpa_in_city_l(cpa_l23, cpa_c2)).
cpa_initially(cpa_in_city_l(cpa_l24, cpa_c2)).
cpa_initially(cpa_in_city_a(cpa_l30, cpa_c3)).
cpa_initially(cpa_in_city_l(cpa_l31, cpa_c3)).
cpa_initially(cpa_in_city_l(cpa_l32, cpa_c3)).
cpa_initially(cpa_in_city_l(cpa_l33, cpa_c3)).
cpa_initially(cpa_in_city_l(cpa_l34, cpa_c3)).
cpa_initially(cpa_in_city_a(cpa_l40, cpa_c4)).
cpa_initially(cpa_in_city_l(cpa_l41, cpa_c4)).
cpa_initially(cpa_in_city_l(cpa_l42, cpa_c4)).
cpa_initially(cpa_in_city_l(cpa_l43, cpa_c4)).
cpa_initially(cpa_in_city_l(cpa_l44, cpa_c4)).
cpa_initially(cpa_in_city_t(cpa_t0, cpa_c0)).
cpa_initially(cpa_at_tl(cpa_t0, cpa_l03)).
cpa_initially(cpa_in_city_t(cpa_t1, cpa_c1)).
cpa_initially(cpa_at_tl(cpa_t1, cpa_l11)).
cpa_initially(cpa_in_city_t(cpa_t2, cpa_c2)).
cpa_initially(cpa_at_tl(cpa_t2, cpa_l22)).
cpa_initially(cpa_in_city_t(cpa_t3, cpa_c3)).
cpa_initially(cpa_at_ta(cpa_t3, cpa_l30)).
cpa_initially(cpa_in_city_t(cpa_t4, cpa_c4)).
cpa_initially(cpa_at_tl(cpa_t4, cpa_l43)).
cpa_initially(cpa_at_aa(cpa_a0, cpa_l00)).
cpa_initially(cpa_oneof([cpa_at_oa(cpa_p0, cpa_l00), cpa_at_ol(cpa_p0, cpa_l01), cpa_at_ol(cpa_p0, cpa_l02), cpa_at_ol(cpa_p0, cpa_l03), cpa_at_ol(cpa_p0, cpa_l04)])).
cpa_initially(cpa_oneof([cpa_at_oa(cpa_p1, cpa_l20), cpa_at_ol(cpa_p1, cpa_l21), cpa_at_ol(cpa_p1, cpa_l22), cpa_at_ol(cpa_p1, cpa_l23), cpa_at_ol(cpa_p1, cpa_l24)])).
cpa_initially(cpa_oneof([cpa_at_oa(cpa_p2, cpa_l10), cpa_at_ol(cpa_p2, cpa_l11), cpa_at_ol(cpa_p2, cpa_l12), cpa_at_ol(cpa_p2, cpa_l13), cpa_at_ol(cpa_p2, cpa_l14)])).
cpa_initially(cpa_oneof([cpa_at_oa(cpa_p3, cpa_l20), cpa_at_ol(cpa_p3, cpa_l21), cpa_at_ol(cpa_p3, cpa_l22), cpa_at_ol(cpa_p3, cpa_l23), cpa_at_ol(cpa_p3, cpa_l24)])).
cpa_initially(cpa_oneof([cpa_at_oa(cpa_p4, cpa_l40), cpa_at_ol(cpa_p4, cpa_l41), cpa_at_ol(cpa_p4, cpa_l42), cpa_at_ol(cpa_p4, cpa_l43), cpa_at_ol(cpa_p4, cpa_l44)])).
cpa_initially(neg(X)) :- fluent(X), \+ cpa_initially(X), \+ unknown(X).
unknown(X):- fluent(X),
            findall(L, (cpa_initially(cpa_oneof(Y)), member(L,Y)), LUnk),
            member(X, LUnk).
unknown(X):- fluent(X), cpa_unknown(X).
unknown(X) :- fluent(X), (cpa_initially(cpa_or(Y)),in_or(Y,X);
          cpa_initially(cpa_or(Y,Z)), (in_or(Y,X);in_or(Z,X))), !.
unknown(X) :- fluent(X), cpa_initially(cpa_oneof(ListBig)), member(ListSmall,ListBig),
           member(X,ListSmall).
in_or(X,X) :- !.
in_or(neg(X),X) :- !.
in_or(cpa_or(Y),X) :- in_or(Y,X).
in_or(cpa_or(Y,Z),X) :- (in_or(Y,X);in_or(Z,X)).
cpa_unknown(nop).

%%%% Goals %%%%
plan_goal(cpa_at_oa(cpa_p0, cpa_l10)).
plan_goal(cpa_at_ol(cpa_p1, cpa_l12)).
plan_goal(cpa_at_ol(cpa_p2, cpa_l11)).
plan_goal(cpa_at_ol(cpa_p3, cpa_l32)).
plan_goal(cpa_at_ol(cpa_p4, cpa_l42)).
