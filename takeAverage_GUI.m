UnitWeight_Final_Dist = UnitWeight_Lab_Distributed;
Cohesion_Final = Cohesion_Distributed;
[M, N] = size(Cohesion_Distributed);
for i = 1: N;
    D = Cohesion_Distributed(:,i);
    E = UnitWeight_Lab_Distributed(:,i);
    C1{i}= D(~cellfun('isempty',D));
    F1{i}= E(~cellfun('isempty',E));
   C2 = cell2mat(C1{i});
   F2 = cell2mat(F1{i});
   C2(isnan(C2))=[];
   if isempty(C2)
       continue
   else
   F2(isnan(F2))=[];
%  C = C1(~isnan(C1));
avgCohesion = min(C2);
avgUnitWeight = mean(F2);
for k = 1:length(C1{i})
Cohesion_Final{k,i} = avgCohesion;
UnitWeight_Final_Dist{k,i}=avgUnitWeight;
end
   end
end
