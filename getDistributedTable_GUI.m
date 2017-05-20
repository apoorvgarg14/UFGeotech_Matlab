function [struct_boringWiseLabData] = getDistributedTable_GUI(handles)
nestedStructure = fieldnames(handles.Project);
units = handles.Project_LabUnits.Lab.units;
for i1 = 1:length(handles.ExplorationType)
   
for z1 = 1:length(handles.Table.ExplorationDesignation_Combined)
    if strcmp(handles.ExplorationType{i1},handles.Table.ExplorationDesignation_Combined{z1})
  Elevation_Distributed(z1)= handles.ElevationValues(z1)-handles.Table.Depth_Combined(z1);
  ExplorationDesignation_Distributed{z1} = handles.Table.ExplorationDesignation_Combined{z1};
   USCSCode_Distributed{z1} = handles.Table.USCSCode_Combined{z1};
   MoistureContent_Distributed(z1) = handles.Table.MoistueContent_Combined(z1);
   UnitWeight_Distributed(z1) = handles.Table.TotalUnit_Combined(z1);
   Cohesion_Distributed(z1) = handles.Table.Cohesion_Combined(z1);
   FrictionAngle_Distributed(z1) = handles.Table.FrictionAngle_Combined(z1);
   
    else  
        Elevation_Distributed(z1) = 200000;
        ExplorationDesignation_Distributed{z1} = 'empty';
        USCSCode_Distributed{z1} = 'empty';
        MoistureContent_Distributed(z1) = 700000;
        UnitWeight_Distributed(z1) =100000;
        Cohesion_Distributed(z1) =500000;
        FrictionAngle_Distributed(z1) =10000;
        
    end
end
R = Elevation_Distributed;
R1 = ExplorationDesignation_Distributed;
R2 = USCSCode_Distributed;
R3 = MoistureContent_Distributed;
R4 = UnitWeight_Distributed;
R5 = Cohesion_Distributed;
R6 = FrictionAngle_Distributed;


Elevation_Final{i1} = R(R~=200000);
MoistureContent_Final{i1} = R3(R3~=700000);
UnitWeight_Final{i1} = R4(R4~=100000);
Cohesion_Final{i1} = R5(R5~=500000);
FrictionAngle_Final{i1} = R6(R6~=10000);

% ExplorationDesignation_Final{i1} = R1(~isempty(R1));

[~, I1] = find(cellfun(@(s) isequal(s, 'empty'), R1));
R1(I1) = [];
ExplorationDesignation_Final{i1} = R1;

[~, I2] = find(cellfun(@(s) isequal(s, 'empty'), R2));
R2(I2) = [];

USCSCode_Final{i1} = R2;
% adding units ===========================================================
A=cell2mat(Elevation_Final(i1)');
B = num2cell(A);
C = [units{3},B];

C1 =[units{2},ExplorationDesignation_Final{i1}];

C2 = [units{4},USCSCode_Final{i1}];

A3 = cell2mat(MoistureContent_Final(i1));
B3 = num2cell(A3);
C3 = [units{7},B3];

A4 = cell2mat(UnitWeight_Final(i1));
B4 = num2cell(A4);
C4 = [units{8},B4];

A5 = cell2mat(Cohesion_Final(i1));
B5 = num2cell(A5);
C5 = [units{36},B5]; 

A6 = cell2mat(FrictionAngle_Final(i1));
B6 = num2cell(A6);
C6 = [units{37},B6]; 

struct_boringWiseLabData.(nestedStructure{i1}).Table = table((C'),(C1'),(C2'),(C3'),(C4'),(C5'),(C6'));
end



