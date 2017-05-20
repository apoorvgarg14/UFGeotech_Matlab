function qp=Total_Stress_Bearing_Capacity_Approach_AASHTO_and_API(Soil_type,Su)

if strcmpi(Soil_type,'Cohesive')
Su_bearing_layer = Su(length(Su));
Nc=9;
qp=Nc.*Su_bearing_layer;
end

%Su = undrained shear strength (ksf)
%Nc=cohesion term bearing capacity factor (dimensionless)