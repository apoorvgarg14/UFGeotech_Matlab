function qp=Bearing_Capacity_Approach_API(soil_type, Relative_Density, sigma_v_tip)

if strcmp(soil_type,'Cohesionless')
    if strcmpi(Relative_Density,'Loose Sand-Silt')
        N_q=0; 
     elseif strcmpi(Relative_Density,'Medium Dense Sand-Silt')
        N_q=12;
     elseif strcmpi(Relative_Density, 'Medium Dense Sand Dense Sand-Silt')
        N_q=20;
     elseif strcmpi(Relative_Density, 'dense sand very dense sand-silt')
        N_q=40; 
     elseif strcmpi(Relative_Density,'very dense sand')
        N_q=50;
    end
end

qp=N_q*(sigma_v_tip/1000);   %%unit of qp is (ksf)

if N_q==12 && qp>60   %%Check with limitting unit base resistance
   qp=60;
 elseif N_q==20 && qp>100
   qp=100;
 elseif N_q==40 && qp>200
    qp=200;
 elseif N_q==50 && qp>250
    qp=250;
end

% N_q = dimensionless bearing capacity factor
%sigma_v_tip = vertical effective stress at the pile tip(psf) 
