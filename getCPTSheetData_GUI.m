%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: M:\Test\Project#24-Steel_Exploration Data.xlsx
%    Worksheet: CPT ALGSGS-08-14CPT
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2016/06/07 12:56:35
%% for all CPT sheets
function [fileName, CPTSheetNames, Project_CPT ] = getCPTSheetData_GUI( p1,f1 )
fileName = strcat(p1,f1);
[~,sheetName,~] = xlsfinfo(fileName);
 sheetName = sheetName';

charSheetName = char(sheetName);

for i = 1:1:length(sheetName)
 if strcmp(charSheetName(i,1),'C') && strcmp(charSheetName(i,2),'P')&& strcmp(charSheetName(i,3),'T') 
CPTSheetName(i) = sheetName(i);
 end
end
CPTSheetNames = CPTSheetName(~cellfun(@isempty,CPTSheetName));


clearvars x i CPTSheetName charSheetName;
for i = 1:1:length(CPTSheetNames)
%% Import the data
[~, ~, raw0_0] = xlsread(fileName,CPTSheetNames{i},'C20:D3020');
[~, ~, raw0_1] = xlsread(fileName,CPTSheetNames{i},'G20:J3020');
[~, ~, raw0_2] = xlsread(fileName,CPTSheetNames{i},'O20:O3020');
[~, ~, raw0_3] = xlsread(fileName,CPTSheetNames{i},'S20:S3020');
[~, ~, raw0_4] = xlsread(fileName,CPTSheetNames{i},'V20:V3020');
[~, ~, raw0_5] = xlsread(fileName,CPTSheetNames{i},'Z20:AA3020');
[~, ~, raw0_6] = xlsread(fileName,CPTSheetNames{i},'AC20:AC3020');
[~, ~, raw0_7] = xlsread(fileName,CPTSheetNames{i},'AJ20:AL3020');
raw = [raw0_0,raw0_1,raw0_2,raw0_3,raw0_4,raw0_5,raw0_6,raw0_7];
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]);

%% Allocate imported array to column variable names
GSW_ExtraData = cellVectors(:,1);
GSW_Unit = cellVectors(:,2);
Elevation = cellVectors(:,3);
Depth = cellVectors(:,4);
Qc = cellVectors(:,5);
Fs = cellVectors(:,6);
FrictionRatio = cellVectors(:,7);
SoilBehaviorType = cellVectors(:,8);
Cohesion = cellVectors(:,9);
DepthToBottomLayer = cellVectors(:,10);
LayerThickness = cellVectors(:,11);
USCScode = cellVectors(:,12);
SPT_BlowCount = cellVectors(:,13);
SPT_BlowIncrement = cellVectors(:,14);
GenCohesion = cellVectors(:,15);

%% Clear temporary variables
clearvars data raw raw0_0 raw0_1 raw0_2 raw0_3 raw0_4 raw0_5 raw0_6 raw0_7 cellVectors;

%% Create Script
structureSheetName = matlab.lang.makeValidName(CPTSheetNames{i});
Project_CPT.(structureSheetName) = struct('GSW_ExtraData',{GSW_ExtraData},'GSW_Unit',{GSW_Unit} ,'Elevation',{Elevation} ,'Depth',{Depth} ,'Qc',{Qc} ,'Fs',{Fs} ,'FrictionRatio',{FrictionRatio}, 'SoilBehaviorType',{SoilBehaviorType},'Cohesion',{Cohesion},'DepthToBottomLayer',{DepthToBottomLayer},'LayerThickness',{LayerThickness},'USCScode',{USCScode},'SPT_BlowCount',{SPT_BlowCount}, 'SPT_BlowIncrement',{SPT_BlowIncrement},'GenCohesion',{GenCohesion});
end
end