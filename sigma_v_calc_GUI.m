function [ sigma_v, PorePressure, sigma_t ] = sigma_v_calc_GUI( Soil_Elev2, Soil_Type, GWT1, Ground_Elev1, Gamma1)
% sigma_v_calculator Summary of this function goes here
%   Detailed explanation goes here

% units ==================================================================
[Soil_Elev1] = convertTofeet(Soil_Elev2);
%====================================unit function========================

if strcmpi(Soil_Elev2{1},'feet')||strcmpi(Soil_Elev2{1},'Select Unit')
GWT = (GWT1);
Ground_Elev =(Ground_Elev1);
elseif strcmpi(Soil_Elev2{1},'inches')
    GWT = GWT1/12;
    Ground_Elev = Ground_Elev1/12;
elseif strcmpi(Soil_Elev2{1},'meters')
    GWT = 3.28*GWT1;
    Ground_Elev = 3.28*Ground_Elev1;
end


%=====================================keep units out for calc=============
for i =2:length(Soil_Elev1)
    Soil_Elev(i-1) = Soil_Elev1{i};
    Gamma(i-1) = Gamma1{i};
end
Soil_Type = Soil_Type(2:end); 
Soil_Elev =Soil_Elev';
Gamma = Gamma';
%=========================================================================


[M, N] = size(Soil_Elev);
% if strcmpi(Gamma1{1},'pcf')
Gamma_Water = 62.4;
% elseif strcmpi(Gamma1{1},'kN/m3');
%     Gamma_Water = 9.807;
% end
    


if all(isnan(Soil_Elev))
    sigma_v = NaN;
    PorePressure = NaN;
    sigma_t = NaN;
else

for i=1:M
    GWD(i,1) = GWT(i,1) - Ground_Elev(i,1);
    for j=1:N
        if Soil_Elev(i,j)~=0
            if Soil_Elev(i,j) < GWT(i,1)
                PorePressure(i,j) = Gamma_Water * (GWT(i,1) - Soil_Elev(i,j));
            else PorePressure(i,j) = 0;
            end

            if (strcmp(Soil_Type{i,j},'GW')|| strcmp(Soil_Type{i,j},'GP'))
                if i == 1
                    sigma_t(i,j) = Gamma(i,j)*(Ground_Elev(i,1)-Soil_Elev(i,j));
                else
                    sigma_t(i,j) = Gamma(i,j)*(Soil_Elev(i-1,j)-Soil_Elev(i,j))+sigma_t(i-1,j);
                end
                
            elseif (strcmp(Soil_Type{i,j},'GM')|| strcmp(Soil_Type{i,j},'GC'))
                if i == 1
                    sigma_t(i,j) = Gamma(i,j)*(Ground_Elev(i,1)-Soil_Elev(i,j));
                else
                    sigma_t(i,j) = Gamma(i,j)*(Soil_Elev(i-1,j)-Soil_Elev(i,j))+sigma_t(i-1,j);
                end
                
            elseif (strcmp(Soil_Type{i,j},'SP') || strcmp(Soil_Type{i,j},'SW') || strcmpi(Soil_Type{i,j},'Silt')||strcmpi(Soil_Type{i,j},'Sandy Silt'))
                if i == 1
                    sigma_t(i,j) = Gamma(i,j)*(Ground_Elev(i,1)-Soil_Elev(i,j));
                else
                    sigma_t(i,j) = Gamma(i,j)*(Soil_Elev(i-1,j)-Soil_Elev(i,j))+sigma_t(i-1,j);
                end
                
            elseif (strcmp(Soil_Type{i,j},'SM')|| strcmp(Soil_Type{i,j},'SC')|| strcmp(Soil_Type{i,j},'Sand')|| strcmp(Soil_Type{i,j},'SP-SM')|| strcmpi(Soil_Type{i,j},'Silty Sand')|| strcmpi(Soil_Type{i,j},'Clayey Sand'))
                if i == 1
                    sigma_t(i,j) = Gamma(i,j)*(Ground_Elev(i,1)-Soil_Elev(i,j));
                else
                    sigma_t(i,j) = Gamma(i,j)*(Soil_Elev(i-1,j)-Soil_Elev(i,j))+sigma_t(i-1,j);
                end   
                
            elseif (strcmp(Soil_Type{i,j},'ML')|| strcmp(Soil_Type{i,j},'CL')|| strcmp(Soil_Type{i,j},'Clay'))
                if i == 1
                    sigma_t(i,j) = Gamma(i,j)*(Ground_Elev(i,1)-Soil_Elev(i,j));
                else
                    sigma_t(i,j) = Gamma(i,j)*(Soil_Elev(i-1,j)-Soil_Elev(i,j))+sigma_t(i-1,j);
                end      
                
            elseif (strcmp(Soil_Type{i,j},'OL') || strcmp(Soil_Type{i,j},'MH')||strcmpi(Soil_Type{i,j},'Silty Clay'))
                if i == 1
                    sigma_t(i,j) = Gamma(i,j)*(Ground_Elev(i,1)-Soil_Elev(i,j));
                else
                    sigma_t(i,j) = Gamma(i,j)*(Soil_Elev(i-1,j)-Soil_Elev(i,j))+sigma_t(i-1,j);
                end     
                
            elseif (strcmp(Soil_Type{i,j},'CH')|| strcmp(Soil_Type{i,j},'OH') || strcmp(Soil_Type{i,j},'PT'))
                if i == 1
                    sigma_t(i,j) = Gamma(i,j)*(Ground_Elev(i,1)-Soil_Elev(i,j));
                else
                    sigma_t(i,j) = Gamma(i,j)*(Soil_Elev(i-1,j)-Soil_Elev(i,j))+sigma_t(i-1,j);
                end          

            elseif (strcmp(Soil_Type{i,j},'Limestone Soft')||strcmpi(Soil_Type{i,j},'Limestone'))
                if i == 1
                    sigma_t(i,j) = Gamma(i,j)*(Ground_Elev(i,1)-Soil_Elev(i,j));
                else
                    sigma_t(i,j) = Gamma(i,j)*(Soil_Elev(i-1,j)-Soil_Elev(i,j))+sigma_t(i-1,j);
                end 
  
            elseif (strcmp(Soil_Type{i,j},'Limestone Hard'))
                if i == 1
                    sigma_t(i,j) = Gamma(i,j)*(Ground_Elev(i,1)-Soil_Elev(i,j));
                else
                    sigma_t(i,j) = Gamma(i,j)*(Soil_Elev(i-1,j)-Soil_Elev(i,j))+sigma_t(i-1,j);
                end
            else
                if i == 1
                    sigma_t(i,j) = Gamma(i,j)*(Ground_Elev(i,1)-Soil_Elev(i,j));
                else
                    sigma_t(i,j) = Gamma(i,j)*(Soil_Elev(i-1,j)-Soil_Elev(i,j))+sigma_t(i-1,j);
                end 
            end
        else sigma_t(i,j) = 0;   
            PorePressure(i,j) = 0;
        end
        
    end
    t =1;
    sigma_v(i,:) = sigma_t(i,:) - PorePressure(i,:);
    
end
end
%========================================================================
 unit_sigma_v = {'psf'};
 sigma_v = [unit_sigma_v;num2cell(sigma_v)];

clearvars L M i j;
end



