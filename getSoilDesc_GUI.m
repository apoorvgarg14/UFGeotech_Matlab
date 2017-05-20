function [SoilDesc] = getSoilDesc_GUI(Soil_Type)

% SoilDesc = 'N/A';
       for i= 1:length(Soil_Type)
  

 if strcmp(Soil_Type{i},'Sand')||strcmp(Soil_Type{i},'GW')||strcmp(Soil_Type{i},'GP')||strcmp(Soil_Type{i},'GM')||strcmp(Soil_Type{i},'GC')||strcmp(Soil_Type{i},'SW')||strcmp(Soil_Type{i},'SP')||strcmp(Soil_Type{i},'SM')||strcmp(Soil_Type{i},'SC') 
    SoilDesc{i} = 'Medium Dense Sand-Silt';
elseif strcmp(Soil_Type{i},'Clay')||strcmp(Soil_Type{i},'ML')||strcmp(Soil_Type{i},'CL')||strcmp(Soil_Type{i},'OL')||strcmp(Soil_Type{i},'MH')||strcmp(Soil_Type{i},'CH')||strcmp(Soil_Type{i},'OH')||strcmp(Soil_Type{i},'PT')
    SoilDesc{i} = 'Cohesive';
 elseif strcmp(Soil_Type{i},'Select')
     SoilDesc{i} = 'Cohesive';
 end
       end
end
