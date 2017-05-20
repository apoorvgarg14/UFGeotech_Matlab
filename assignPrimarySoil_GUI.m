function [Primary_Soil_Desc] = assignPrimarySoil_GUI(Project,i,struct_boringWiseLabData)
nestedStructure = fieldnames(Project);
nestedStructure_boringWise = fieldnames(struct_boringWiseLabData);
A1 =struct_boringWiseLabData.(nestedStructure_boringWise{i}).Table.Var1;
A = A1(2:end);
if isempty(A)
   Primary_Soil_Desc1 = []; 
else

GenElevation = Project.(nestedStructure{i}).GWT_ExtraData{1}-Project.(nestedStructure{i}).GenDepthToBoring;
for x = 1:length(A);


M = A{x}-GenElevation;
M(M<0) = 10000;
[M1,index] = min(M);



Primary_Soil_Desc1{x} = Project.(nestedStructure{i}).PrimarySoilDesc{index};


end
end
unit = {'(-)'};
Primary_Soil_Desc = [unit;Primary_Soil_Desc1'];
end