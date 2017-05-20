function [fileName, BoringSheetNames, sheetName, Project, ExplorationType ] = getBoringSheetData_GUI( p1,f1 )
%UNTITLED Summary of this function goes here

fileName = strcat(p1,f1);
[~,sheetName,~] = xlsfinfo(fileName);
 sheetName = sheetName';

charSheetName = char(sheetName);

for i = 1:1:length(sheetName)
 if strcmp(charSheetName(i,1),'B') && strcmp(charSheetName(i,2),'o')&& strcmp(charSheetName(i,3),'r')&& strcmp(charSheetName(i,4),'i')&& strcmp(charSheetName(i,5),'n')&& strcmp(charSheetName(i,6),'g')
BoringSheetName(i) = sheetName(i);

 end
end
BoringSheetNames = BoringSheetName(~cellfun(@isempty, BoringSheetName));

for i = 1:1:length(BoringSheetNames)


%% Import the data
[~, ~, raw0_0] = xlsread(fileName,BoringSheetNames{i},'C21:C115');
[~, ~, raw0_1] = xlsread(fileName,BoringSheetNames{i},'G21:H115');
[~, ~, raw0_2] = xlsread(fileName,BoringSheetNames{i},'J21:K115');
[~, ~, raw0_3] = xlsread(fileName,BoringSheetNames{i},'M21:M115');
[~, ~, raw0_4] = xlsread(fileName,BoringSheetNames{i},'O21:Q115');
[~, ~, raw0_5] = xlsread(fileName,BoringSheetNames{i},'S21:T115');
[~, ~, raw0_6] = xlsread(fileName,BoringSheetNames{i},'Z21:Z115');
[~, ~, raw0_7] = xlsread(fileName,BoringSheetNames{i},'AD21:AD115');
raw = [raw0_0,raw0_1,raw0_2,raw0_3,raw0_4,raw0_5,raw0_6,raw0_7];
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,[1,9,10,11]);
raw = raw(:,[2,3,4,5,6,7,8,12,13]);

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
GWT_ExtraData = cellVectors(:,1);
Elevation = data(:,1);
Depth = data(:,2);
FieldBlowCount = data(:,3);
BlowIncrement = data(:,4);
SoilLayerNumber = data(:,5);
GenSoilLayer = data(:,6);
GenDepthToBoring = data(:,7);
USCScode = cellVectors(:,2);
PrimarySoilDesc = cellVectors(:,3);
SecondarySoilDesc = cellVectors(:,4);
Cohesion = data(:,8);
UnitWeight = data(:,9);



%% Create Structure
structureSheetName = matlab.lang.makeValidName(BoringSheetNames{i});
Project.(structureSheetName) = struct('Elevation',Elevation,'Depth',Depth,'FieldBlowCount',FieldBlowCount,'BlowIncrement',BlowIncrement, 'SoilLayerNumber', SoilLayerNumber,'GenSoilLayer',GenSoilLayer,'GenDepthToBoring', GenDepthToBoring,'Cohesion',Cohesion,'UnitWeight',UnitWeight,'GWT_ExtraData',{GWT_ExtraData},'USCScode',{USCScode},'PrimarySoilDesc',{PrimarySoilDesc},'SecondarySoilDesc',{SecondarySoilDesc});

%% Clear temporary variables
clearvars data raw raw0_0 raw0_1 raw0_2 raw0_3 raw0_4 raw0_5 raw0_6 raw0_7 cellVectors R;
clearvars Elevation Depth FieldBlowCount BlowIncrement SoilLayerNumber GenSoilLayer GenDepthToBoring Cohesion UnitWeight GWT_ExtraData USCScode PrimarySoilDesc PrimarySoilDesc SecondarySoilDesc
clearvars structureSheetName;


%% Import the data
[~, ~, raw] = xlsread(fileName,BoringSheetNames{i},'C17:C17');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,1);

%% Allocate imported array to column variable names
ExplorationType{i} = cellVectors(:,1);

%% Clear temporary variables
clearvars raw cellVectors i;
end
end
