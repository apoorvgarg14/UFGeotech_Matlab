function [sigma_v_tip, sigma_v_mid, PorePressure, sigma_t_mid ] = sigma_v_calc_GUI_modified(GWE, Start_Elev, End_Elev, Gamma_soil, Pile_tip_Elev)
% sigma_v_calculator Summary of this function goes here
% Detailed explanation goes here

M = length(Start_Elev);   %%Specified from the user
Gamma_Water = 62.4;           %%unit weight of water in US unit lbs/ft3

% if all(isnan(Start_Elev))   %%give a value to a "not available" soil_Elev layer to check
%     sigma_v_mid = NaN;
%     PorePressure = NaN;
%     sigma_t_mid = NaN;
% else

for i=1:M
    Layer_Thickness(i) = Start_Elev(i)-End_Elev(i);
    
    if i==1       %%Calculate the total vertical stress at the mid-level and end of each layer
      sigma_t_mid(i) = Layer_Thickness(i)*Gamma_soil(i)/2; %in US unit lbs/ft2
      sigma_t_end(i) = Layer_Thickness(i)*Gamma_soil(i);   %in US unit lbs/ft2
    else
      sigma_t_mid(i) = Layer_Thickness(i)*Gamma_soil(i)/2+sigma_t_end(i-1);  %in US unit lbs/ft2
      sigma_t_end(i) = Layer_Thickness(i)*Gamma_soil(i)+sigma_t_end(i-1);    %in US unit lbs/ft2
    end
    
    Mid_Elev(i) = Start_Elev(i)+Layer_Thickness(i)/2; %%Define Mid_Elev of each layer
    
    if Mid_Elev(i)<= GWE    %%Pore pressure at the mid-level of each layer
       PorePressure(i) = Gamma_Water*(GWE-Mid_Elev(i)); %in US unit lbs/ft2
    else
       PorePressure(i) = 0;
    end
     
    sigma_v_mid(i) = sigma_t_mid(i) - PorePressure(i); %%vertical effective stress at the mid-level of each layer %in US unit lbs/ft2
    
    %%Calculate vertical effective stress at the pile tip in the bearing layer
    if i==M 
       sigma_t_tip = (Start_Elev(i)-Pile_tip_Elev)*Gamma_soil(i)+sigma_t_end(i-1); %%Total vertical stress at the tip %in US unit lbs/ft2
       
       if Pile_tip_Elev <= GWE    %%Pore pressure at the tip %in US unit lbs/ft2
        PorePressure_tip = Gamma_Water*(GWE-Pile_tip_Elev);
       else
        PorePressure_tip = 0;
       end
       
       sigma_v_tip = sigma_t_tip-PorePressure_tip; %%vertical effective stress at the tip %in US unit lbs/ft2
    end
    
end
clearvars L M i j;
% end



