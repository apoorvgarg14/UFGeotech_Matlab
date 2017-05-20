function [Q_t_full,Q_t_annulus,Q_s_inner,Q_s_outer,Q_total_case1,Q_total_case2] = calculated_resistance_capacities_API(pile_diameter_outer,pile_thickness,q_s,q_t,Start_Elev,End_Elev,Pile_tip_Elev)
pile_circumference_outer = pi*pile_diameter_outer/12;    %%unit in ft
pile_circumference_inner = pi*(pile_diameter_outer/12-2*pile_thickness/12);   %%unit in ft;change the unit of pile_thickness from inches into feet

Area_tip_full = pi*((pile_diameter_outer/12)^2)/4;    %% unit in ft2
Area_tip_annulus = Area_tip_full - pi*((pile_diameter_outer/12-2*pile_thickness/12)^2)/4; %%unit in ft2

%%Calculate the total tip resistance of the pile
Q_t_full = Area_tip_full*q_t;     %unit in kips
Q_t_annulus = Area_tip_annulus*q_t;  %unit in kips
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M = length(Start_Elev);
%% calculate the skin resistance capacities of start and middle layers
for i=1:M-1
Layer_thickness(i)=Start_Elev(i)-End_Elev(i);  %%% unit in ft

surface_area_outer(i)= Layer_thickness(i)*pile_circumference_outer;
surface_area_inner(i)= Layer_thickness(i)*pile_circumference_inner;

Q_s_inner_per_layer(i) = surface_area_inner(i)*q_s(i);
Q_s_outer_per_layer(i) = surface_area_outer(i)*q_s(i);
end
%% calculate the skin-resistance capacities at the bearing layer (when i = M)
if Start_Elev(M)-Pile_tip_Elev<0
   Layer_thickness(M) = NaN;
   Layer_thickness(M-1) = Start_Elev(M)-Pile_tip_Elev;
   surface_area_outer(M-1)= Layer_thickness(M-1)*pile_circumference_outer;
   surface_area_inner(M-1)= Layer_thickness(M-1)*pile_circumference_inner;
   Q_s_inner_per_layer(M-1) = surface_area_inner(M-1)*q_s(M-1);
   Q_s_outer_per_layer(M-1) = surface_area_outer(M-1)*q_s(M-1);
else
   Layer_thickness(M) = Start_Elev(M)-Pile_tip_Elev;
   surface_area_outer(M)= Layer_thickness(M)*pile_circumference_outer;
   surface_area_inner(M)= Layer_thickness(M)*pile_circumference_inner;
   Q_s_inner_per_layer(M) = surface_area_inner(M)*q_s(M);
   Q_s_outer_per_layer(M) = surface_area_outer(M)*q_s(M);
end
%% Total skin resistance of the pile
Q_s_inner = sum(Q_s_inner_per_layer);  %%unit in kips
Q_s_outer = sum(Q_s_outer_per_layer);  %%unit in kips
%%Output Cases 
%%Case 1: outer skin resistance + full tip resistance
Q_total_case1=Q_t_full+Q_s_outer;
%%Case 2: outer skin resistance + inner skin resistance + annulus tip
%%resistance
Q_total_case2=Q_t_annulus+Q_s_inner+Q_s_outer;