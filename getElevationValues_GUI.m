function [ElevationValues] = getElevationValues_GUI(handles,nestedStructure)

for z = 1:length(handles.Table.Depth_Combined)
    for y  = 1:length(handles.ExplorationType)
        if isstr(handles.ExplorationType{y})
        
if strcmp(handles.Table.ExplorationDesignation_Combined{z},handles.ExplorationType{y})

    ElevationValues(z)= handles.Project.(nestedStructure{y}).GWT_ExtraData{1};
end
        else
if strcmp(handles.Table.ExplorationDesignation_Combined{z},num2str(cell2mat(handles.ExplorationType{y})))

    ElevationValues(z)= handles.Project.(nestedStructure{y}).GWT_ExtraData{1};
end            
        end
    end
end