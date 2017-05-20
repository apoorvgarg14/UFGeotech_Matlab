function qs=API_Beta_Method_base_GUI(soil_type,sigma_o)

if strcmp(soil_type,'Medium Dense Sand-Silt')
    base_Nq = 12;
elseif strcmp(soil_type,'Medium Dense Sand Desnse Sand-Silt')
    base_Nq = 20;
elseif strcmp(soil_type,'Dense Sand Very Dense Sand-Silt')
    base_Nq = 40;
elseif strcmp(soil_type,'Very Dense Sand')
    base_Nq = 50;   
    
end

qs1 = base_Nq*sigma_o;

if qs1>60000 && strcmp(soil_type,'Medium Dense Sand-Silt') 
    qs = 60000;
elseif qs1>100000 && strcmp(soil_type,'Medium Dense Sand Desnse Sand-Silt')
    qs = 100000;
elseif qs1>200000 && strcmp(soil_type,'Dense Sand Very Dense Sand-Silt')
    qs = 200000;
elseif qs1>250000 && strcmp(soil_type,'Very Dense Sand')
    qs = 250000;
    
else
    qs = qs1;
end
end