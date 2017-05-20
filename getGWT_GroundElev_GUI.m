function[GWT, Ground_Elev] = getGWT_GroundElev_GUI(Project,sheetNumber, Soil_Depth)
nestedStructure = fieldnames(Project);
for i =1: length(Soil_Depth)
    GWT(i,1) = cell2mat(Project.(nestedStructure{sheetNumber}).GWT_ExtraData(13,1));
    Ground_Elev(i,1) = cell2mat(Project.(nestedStructure{sheetNumber}).GWT_ExtraData(1,1));
end
end