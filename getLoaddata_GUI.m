function [fileName, LoadSheetNames, Project_Load ] = getLoaddata_GUI( p3,f3 )
fileName = strcat(p3,f3);
[~,sheetName,~] = xlsfinfo(fileName);
 sheetName = sheetName';

charSheetName = char(sheetName);

for i = 1:1:length(sheetName)
 if strcmpi(charSheetName(i,1),'S') && strcmpi(charSheetName(i,2),'u')&& strcmpi(charSheetName(i,3),'m')&& strcmpi(charSheetName(i,4),'m')&& strcmpi(charSheetName(i,5),'a')
LoadSheetName(i) = sheetName(i);
 end
end
LoadSheetNames = LoadSheetName(~cellfun(@isempty,LoadSheetName));


clearvars x i LoadSheetName charSheetName;
for i = 1:1:length(LoadSheetNames)








%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\Users\apoorvgarg\Dropbox\FHWA_Matlab\Apoorv\Steel Project Functions\Steel Project Files\Project#24-Steel_Load Test Data.xlsx
%    Worksheet: Summary TP-9
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2016/08/02 13:53:08

%% Import the data
[~, ~, raw] = xlsread(fileName,LoadSheetNames{i},'C28:D30');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,2);
raw = raw(:,1);

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
GSE_ExtraData = data(:,1);
Unit = cellVectors(:,1);

%% Clear temporary variables
clearvars data raw cellVectors;


%% create structure
nestedStructure_Load = matlab.lang.makeValidName(LoadSheetNames{i});
Project_Load.(nestedStructure_Load)= struct('GSE_ExtraData',{GSE_ExtraData},'Unit',{Unit});

end
end

