function qs=beta_Method_API(soil_type, Relative_Density, sigma_v_mid)

if strcmp(soil_type,'Cohesionless')
    if strcmpi(Relative_Density, 'loose sand-silt')
       beta=0; 
     elseif strcmpi(Relative_Density,'medium dense sand-silt')
       beta=0.29;
     elseif strcmpi(Relative_Density,'medium dense sand dense sand-silt')
       beta=0.37;
     elseif strcmpi(Relative_Density, 'dense sand very dense sand-silt')
       beta=0.46; 
     elseif strcmpi(Relative_Density, 'very dense sand')
       beta=0.56;
    end
end

qs=beta.*(sigma_v_mid/1000); %%unit of qs is (ksf)

if beta==0.29 && qs>1.4   %%Check with limitting unit base resistance
   qs=1.4; %%unit of qs is (ksf)
 elseif beta==0.37 && qs>1.7
   qs=1.7; %%unit of qs is (ksf)
 elseif beta==0.46 && qs>2.0
    qs=2.0; %%unit of qs is (ksf)
 elseif beta==0.56 && qs>2.4
    qs=2.4; %%unit of qs is (ksf)
end

%beta=riction coefficient
%Sigma_v_tip=vertical effective stress(psf)
