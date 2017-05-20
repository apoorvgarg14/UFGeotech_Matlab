function Project = BoringUnits(p1, f1)
range ='G20:AN20';
fileName = strcat(p1,f1);
[~,sheetName,~] = xlsfinfo(fileName);
 sheetName = sheetName';

charSheetName = char(sheetName);


c = 0;
[M N] =size(charSheetName);
for i = 1:1:M
 if strcmp(charSheetName(i,1),'B') && strcmp(charSheetName(i,2),'o')&& strcmp(charSheetName(i,3),'r')
BoringSheetName(i) = sheetName(i);
c = c+1;
 

 end
end


BoringSheetNames = BoringSheetName(~cellfun(@isempty, BoringSheetName));
 if(c>0)
    for i = 1:1:length(BoringSheetNames)


%% Import the data
[~, ~, raw] = xlsread(fileName ,BoringSheetNames{i},range);

units{1,1} = raw;


 structureSheetName = matlab.lang.makeValidName(BoringSheetNames{i});
Project.(structureSheetName) = struct('units',units );



clearvars data raw ;
    end
   
end
end

