function qs=API_Beta_Method_side_GUI(soil_type,sigma_o)

if strcmp(soil_type,'15-35% Medium Dense Sand-Silt')
    side_beta = 0.29;
elseif strcmp(soil_type,'35-65Medium Dense Sand Dense Sand-Silt')
    side_beta = 0.37;
elseif strcmp(soil_type,'65-85Dense Sand Very Dense Sand-Silt')
    side_beta = 0.46;
elseif strcmp(soil_type,'85-100Very Dense Sand')
    side_beta = 0.56;
end

qs1 = side_beta*sigma_o;

if qs1>1400 && strcmp(soil_type,'Medium Dense Sand-Silt')
    qs = 1400;
elseif qs1>1700 && strcmp(soil_type,'Medium Dense Sand Dense Sand-Silt') 
    qs = 1700;

elseif qs1>2000 && strcmp(soil_type,'Dense Sand Very Dense Sand-Silt')
    qs = 2000;
elseif qs1>2400 && strcmp(soil_type,'Very Dense Sand')
    qs = 2400;
else
    qs = qs1;
end
end
    