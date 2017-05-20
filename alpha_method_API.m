function qs=alpha_method_API(soil_type,Su,Sigma_v_mid)

if strcmpi(soil_type,'Cohesive')
phi=Su./(Sigma_v_mid/1000);
if phi<=1
alpha=0.5.*phi.^(-0.5);
else
alpha=0.5.*phi.^(-0.25);
end

if alpha>1
    alpha=1;
end
qs=alpha.*Su;
end
%alpha = adhesion factor 
%Su = undrained shear strength (ksf)
%Sigma_v_mid= initial vertical effective stress at mid-level of each layer (psf)