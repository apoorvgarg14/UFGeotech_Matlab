function[Major_Soil_Type] = checkMajorSoilType_GUI(Soil_Type)
 if isempty(Soil_Type)
       Major_Soil_Type = cell(0,1);
   else
for i= 1:length(Soil_Type)
  

 if strcmp(Soil_Type{i},'Sand')||strcmp(Soil_Type{i},'GW')||strcmp(Soil_Type{i},'GP')||strcmp(Soil_Type{i},'GM')||strcmp(Soil_Type{i},'GC')||strcmp(Soil_Type{i},'SW')||strcmp(Soil_Type{i},'SP')||strcmp(Soil_Type{i},'SM')||strcmp(Soil_Type{i},'SC') 
    Major_Soil_Type{i} = 'Cohesionless';
elseif strcmp(Soil_Type{i},'Clay')||strcmp(Soil_Type{i},'ML')||strcmp(Soil_Type{i},'CL')||strcmp(Soil_Type{i},'OL')||strcmp(Soil_Type{i},'MH')||strcmp(Soil_Type{i},'CH')||strcmp(Soil_Type{i},'OH')||strcmp(Soil_Type{i},'PT')
    Major_Soil_Type{i} = 'Cohesive';
 elseif strcmp(Soil_Type{i},'Select')
     Major_Soil_Type{i} = 'Cohesive';
 end
end
 end
end