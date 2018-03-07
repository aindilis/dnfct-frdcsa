
%% actions ------ 

action cpa_collect(cpa_c1,cpa_f0,cpa_p0);
action cpa_collect(cpa_c1,cpa_f0,cpa_p1);
action cpa_collect(cpa_c1,cpa_f1,cpa_p0);
action cpa_collect(cpa_c1,cpa_f1,cpa_p1);
action cpa_move_left(cpa_f0,cpa_p1,cpa_p0);
action cpa_move_left(cpa_f1,cpa_p1,cpa_p0);
action cpa_move_right(cpa_f0,cpa_p0,cpa_p1);
action cpa_move_right(cpa_f1,cpa_p0,cpa_p1);
action cpa_step_out(cpa_e0,cpa_f0,cpa_p0);
action cpa_step_out(cpa_e0,cpa_f1,cpa_p0);
action cpa_step_out(cpa_e1,cpa_f0,cpa_p1);
action cpa_step_out(cpa_e1,cpa_f1,cpa_p1);
action cpa_go_down(cpa_e0,cpa_f1,cpa_f0);
action cpa_go_down(cpa_e1,cpa_f1,cpa_f0);
action cpa_go_up(cpa_e0,cpa_f0,cpa_f1);
action cpa_go_up(cpa_e1,cpa_f0,cpa_f1);
action cpa_step_in(cpa_e0,cpa_f0,cpa_p0);
action cpa_step_in(cpa_e0,cpa_f1,cpa_p0);
action cpa_step_in(cpa_e1,cpa_f0,cpa_p1);
action cpa_step_in(cpa_e1,cpa_f1,cpa_p1);

%% executable ------ 

executable cpa_collect(cpa_c1,cpa_f0,cpa_p0) if  cpa_at(cpa_f0,cpa_p0);
executable cpa_collect(cpa_c1,cpa_f0,cpa_p1) if  cpa_at(cpa_f0,cpa_p1);
executable cpa_collect(cpa_c1,cpa_f1,cpa_p0) if  cpa_at(cpa_f1,cpa_p0);
executable cpa_collect(cpa_c1,cpa_f1,cpa_p1) if  cpa_at(cpa_f1,cpa_p1);
executable cpa_move_left(cpa_f0,cpa_p1,cpa_p0) if  cpa_at(cpa_f0,cpa_p1);
executable cpa_move_left(cpa_f1,cpa_p1,cpa_p0) if  cpa_at(cpa_f1,cpa_p1);
executable cpa_move_right(cpa_f0,cpa_p0,cpa_p1) if  cpa_at(cpa_f0,cpa_p0);
executable cpa_move_right(cpa_f1,cpa_p0,cpa_p1) if  cpa_at(cpa_f1,cpa_p0);
executable cpa_step_out(cpa_e0,cpa_f0,cpa_p0) if  cpa_inside(cpa_e0);
executable cpa_step_out(cpa_e0,cpa_f1,cpa_p0) if  cpa_inside(cpa_e0);
executable cpa_step_out(cpa_e1,cpa_f0,cpa_p1) if  cpa_inside(cpa_e1);
executable cpa_step_out(cpa_e1,cpa_f1,cpa_p1) if  cpa_inside(cpa_e1);
executable cpa_step_in(cpa_e0,cpa_f0,cpa_p0) if  cpa_at(cpa_f0,cpa_p0);
executable cpa_step_in(cpa_e0,cpa_f1,cpa_p0) if  cpa_at(cpa_f1,cpa_p0);
executable cpa_step_in(cpa_e1,cpa_f0,cpa_p1) if  cpa_at(cpa_f0,cpa_p1);
executable cpa_step_in(cpa_e1,cpa_f1,cpa_p1) if  cpa_at(cpa_f1,cpa_p1);

%% effects ------ 

cpa_collect(cpa_c1,cpa_f1,cpa_p0) causes  cpa_have(cpa_c1), -cpa_coin_at(cpa_c1,cpa_f1,cpa_p0) if  cpa_coin_at(cpa_c1,cpa_f1,cpa_p0);
cpa_collect(cpa_c1,cpa_f1,cpa_p1) causes  cpa_have(cpa_c1), -cpa_coin_at(cpa_c1,cpa_f1,cpa_p1) if  cpa_coin_at(cpa_c1,cpa_f1,cpa_p1);
cpa_move_left(cpa_f0,cpa_p1,cpa_p0) causes  -cpa_at(cpa_f0,cpa_p1), cpa_at(cpa_f0,cpa_p0);
cpa_move_left(cpa_f1,cpa_p1,cpa_p0) causes  -cpa_at(cpa_f1,cpa_p1), cpa_at(cpa_f1,cpa_p0);
cpa_move_right(cpa_f0,cpa_p0,cpa_p1) causes  -cpa_at(cpa_f0,cpa_p0), cpa_at(cpa_f0,cpa_p1);
cpa_move_right(cpa_f1,cpa_p0,cpa_p1) causes  -cpa_at(cpa_f1,cpa_p0), cpa_at(cpa_f1,cpa_p1);
cpa_step_out(cpa_e0,cpa_f0,cpa_p0) causes  cpa_at(cpa_f0,cpa_p0), -cpa_inside(cpa_e0) if  cpa_in(cpa_e0,cpa_f0);
cpa_step_out(cpa_e0,cpa_f1,cpa_p0) causes  cpa_at(cpa_f1,cpa_p0), -cpa_inside(cpa_e0) if  cpa_in(cpa_e0,cpa_f1);
cpa_step_out(cpa_e1,cpa_f0,cpa_p1) causes  cpa_at(cpa_f0,cpa_p1), -cpa_inside(cpa_e1) if  cpa_in(cpa_e1,cpa_f0);
cpa_step_out(cpa_e1,cpa_f1,cpa_p1) causes  cpa_at(cpa_f1,cpa_p1), -cpa_inside(cpa_e1) if  cpa_in(cpa_e1,cpa_f1);
cpa_go_down(cpa_e0,cpa_f1,cpa_f0) causes  cpa_in(cpa_e0,cpa_f0), -cpa_in(cpa_e0,cpa_f1) if  cpa_in(cpa_e0,cpa_f1);
cpa_go_down(cpa_e1,cpa_f1,cpa_f0) causes  cpa_in(cpa_e1,cpa_f0), -cpa_in(cpa_e1,cpa_f1) if  cpa_in(cpa_e1,cpa_f1);
cpa_go_up(cpa_e0,cpa_f0,cpa_f1) causes  cpa_in(cpa_e0,cpa_f1), -cpa_in(cpa_e0,cpa_f0) if  cpa_in(cpa_e0,cpa_f0);
cpa_go_up(cpa_e1,cpa_f0,cpa_f1) causes  cpa_in(cpa_e1,cpa_f1), -cpa_in(cpa_e1,cpa_f0) if  cpa_in(cpa_e1,cpa_f0);
cpa_step_in(cpa_e0,cpa_f0,cpa_p0) causes  cpa_inside(cpa_e0), -cpa_at(cpa_f0,cpa_p0) if  cpa_in(cpa_e0,cpa_f0);
cpa_step_in(cpa_e0,cpa_f1,cpa_p0) causes  cpa_inside(cpa_e0), -cpa_at(cpa_f1,cpa_p0) if  cpa_in(cpa_e0,cpa_f1);
cpa_step_in(cpa_e1,cpa_f0,cpa_p1) causes  cpa_inside(cpa_e1), -cpa_at(cpa_f0,cpa_p1) if  cpa_in(cpa_e1,cpa_f0);
cpa_step_in(cpa_e1,cpa_f1,cpa_p1) causes  cpa_inside(cpa_e1), -cpa_at(cpa_f1,cpa_p1) if  cpa_in(cpa_e1,cpa_f1);

%% initial state ------ 


%% goal state ---------- 
goal  cpa_have(cpa_c1);
