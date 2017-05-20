function [FrictionAngle_Schmertamann_degree,FrictionAngle_Hatanaka,FrictionAngle_PH_T] = FrictionAngle_SPT_GUI(N1,N60,sigma_v1,SPT1,USCScode1,Soil_Type1)

%===========================================convert sigma_v1 here==========
if length(SPT1)==1
FrictionAngle_PH_T = [];
else

for i =2:length(SPT1)
    SPT(i-1) = SPT1{i};
end  


for i = 2:length(sigma_v1)
sigma_v(i-1) = sigma_v1{i};
end

for i = 2:length(USCScode1)
USCScode(i-1) = USCScode1{i};
end

for i = 2:length(Soil_Type1)
Soil_Type(i-1) = Soil_Type1{i};
end

Pa = 2116.22; %in psf

% Hatanaka and Uchida
FrictionAngle_Hatanaka = sqrt(15.4*N1)+20;
for i1 = 1:length(FrictionAngle_Hatanaka)
if FrictionAngle_Hatanaka(i1) >45
    FrictionAngle_Hatanaka(i1) =45;
end
end
%Schmertmann (1975)
for i = 1:length(N60)
FrictionAngle_Schmertamann_rad(i) = atan((N60(i)/(12.2+(20.3*(sigma_v(i)/Pa))))^0.34);
FrictionAngle_Schmertamann_degree(i) =FrictionAngle_Schmertamann_rad(i)*57.2958; 


 if strcmpi(Soil_Type{i},'Silt')||strcmpi(USCScode{i},'SP') || strcmpi(USCScode{i},'SW')|| strcmpi(USCScode{i},'SP') || strcmpi(USCScode{i},'SW') || strcmpi(Soil_Type{i},'Sandy Silt')
     if FrictionAngle_Schmertamann_degree(i)>37
         FrictionAngle_Schmertamann_degree(i)=37;
     end
 elseif strcmpi(Soil_Type{i},'Sand')||(strcmpi(USCScode{i},'SM'))||(strcmpi(USCScode{i},'SC'))|| strcmpi(USCScode{i},'SP-SM')|| strcmpi(Soil_Type{i},'Silty Sand')|| strcmpi(Soil_Type{i},'Clayey Sand')
     if FrictionAngle_Schmertamann_degree(i)>40
         FrictionAngle_Schmertamann_degree(i)=40;
    end
 elseif strcmpi(Soil_Type{i},'Gravel')||strcmpi(USCScode{i},'GW')||strcmpi(USCScode{i},'GP')||strcmpi(USCScode{i},'GM')|| strcmpi(USCScode{i},'GC')
     if FrictionAngle_Schmertamann_degree(i)>45
         FrictionAngle_Schmertamann_degree(i)=45;
     end
 elseif strcmpi(Soil_Type{i},'Clay')||strcmpi(USCScode{i},'ML')|| strcmpi(USCScode{i},'CL')||strcmpi(USCScode{i},'OL')|| strcmpi(USCScode{i},'MH')||strcmpi(Soil_Type{i},'Silty Clay')||strcmpi(USCScode{i},'CH')|| strcmpi(USCScode{i},'OH') || strcmpi(USCScode{i},'PT')
     if FrictionAngle_Schmertamann_degree(i)>0
         FrictionAngle_Schmertamann_degree(i)=0;
     end
 end
% elseif strcmpi(Soil_Type{i},'Select')
     

    

end

FrictionAngle_PH_T = 54-(27.6034*exp(-0.014*SPT));

end