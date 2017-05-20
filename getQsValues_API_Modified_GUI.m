function [qs,qt] = getQsValues_API_Modified_GUI(Final_Cohesion_Matrix, Soil_Type, Soil_Depth,Major_Soil_Type, ExplorationType, Project_Pile, sigma_v, i,SoilDesc)  
nestedStructure_Pile = fieldnames(Project_Pile);
for k= 1:length(nestedStructure_Pile)
if all(isnan(Final_Cohesion_Matrix))
    qs = NaN;
    qt = NaN;
    
else
[~, idx_tip] = min(abs(Soil_Depth-Project_Pile.(nestedStructure_Pile{k}).EmbeddedLength_ExtraData{6}));
for j = 1:length(Soil_Type)

    
if (strcmp(Major_Soil_Type{j},'Cohesive'))
    qs(j)=alpha_method_API_GUI(Final_Cohesion_Matrix(j),sigma_v(j));
elseif (strcmp(Major_Soil_Type{j},'Cohesionless'))
    qs(j)=API_Beta_Method_side_GUI(SoilDesc{j},sigma_v(j));
end
if (j == idx_tip)
for q = 21:1:39
 test_Exploration{q} = ExplorationType{i};
if (strcmp(Project_Pile.(nestedStructure_Pile{k}).ExplorationDesig_ExtraData{q,1},test_Exploration{q}))% error here for continues looping
 

if (strcmp(Major_Soil_Type{j},'Cohesive'))
% qs(idx_tip) = NaN;
qt(k)=Total_Stress_Bearing_Capacity_Approach_AASHTO_and_API_GUI(Final_Cohesion_Matrix(idx_tip));
elseif (strcmp(Major_Soil_Type{j},'Cohesionless'))
% qs(idx_tip) = NaN;
qt(k)=API_Beta_Method_base_GUI(SoilDesc{idx_tip},sigma_v(idx_tip));
end
else continue
end
end
end
end
end
end