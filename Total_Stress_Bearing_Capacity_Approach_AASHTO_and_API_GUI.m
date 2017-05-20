function qp=Total_Stress_Bearing_Capacity_Approach_AASHTO_and_API_GUI(Su)

Nc=9;
qp=Nc.*Su;

%Su = undrained shear strength (ksf)
%Nc=cohesion term bearing capacity factor (dimensionless)