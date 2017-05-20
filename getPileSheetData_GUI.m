function [PileSheetNames, Project_Pile ] = getPileSheetData_GUI(p1,f1)
fileName = strcat(p1,f1);
[~,sheetName,~] = xlsfinfo(fileName);
 sheetName = sheetName';

charSheetName = char(sheetName);

for i = 1:1:length(sheetName)
 if strcmp(charSheetName(i,1),'P') && strcmp(charSheetName(i,2),'i')&& strcmp(charSheetName(i,3),'l')&& strcmp(charSheetName(i,4),'e')
PileSheetName(i) = sheetName(i);
 end
end
PileSheetNames = PileSheetName(~cellfun(@isempty, PileSheetName));

clearvars x i PileSheetName charSheetName;

for i = 1:1:length(PileSheetNames)
%% Import the data
[~, ~, raw0_0] = xlsread(fileName,PileSheetNames{i},'C17:D55');
[~, ~, raw0_1] = xlsread(fileName,PileSheetNames{i},'G17:I55');
raw = [raw0_0,raw0_1];
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,[1,2,3,4,5]);

%% Allocate imported array to column variable names
GroundSurface_ExtraData = cellVectors(:,1);
Unit = cellVectors(:,2);
ExplorationDesig_ExtraData = cellVectors(:,3);
EmbeddedLength_ExtraData = cellVectors(:,4);
embeddedLength_Unit = cellVectors(:,5);

%% Create Structure of Lab data
structureSheetName = matlab.lang.makeValidName(PileSheetNames{i});
Project_Pile.(structureSheetName) = struct('GroundSurface_ExtraData',{GroundSurface_ExtraData},'Unit',{Unit},'ExplorationDesig_ExtraData',{ExplorationDesig_ExtraData},'EmbeddedLength_ExtraData',{EmbeddedLength_ExtraData},'embeddedLength_Unit',{embeddedLength_Unit});


%% Clear temporary variables
clearvars data raw raw0_0 raw0_1 cellVectors;
clearvars GroundSurface_ExtraData Unit ExplorationDesig_ExtraData EmbeddedLength_ExtraData embeddedLength_Unit
clearvars i structureSheetName
end
end