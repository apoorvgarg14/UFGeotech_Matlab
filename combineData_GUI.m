newCohesion = cat(1,Cohesion_Final(:));
newCohesion =  newCohesion(~cellfun('isempty',newCohesion));  
newCohesion = cell2mat(newCohesion);
newCohesion(isnan(newCohesion))= 0;
newCohesion1 = num2cell(newCohesion);


newUnitWeight = cat(1,UnitWeight_Final_Dist(:));
newUnitWeight = newUnitWeight(~cellfun('isempty',newUnitWeight));
newUnitWeight = cell2mat(newUnitWeight);
newUnitWeight(isnan(newUnitWeight)) = 0;
newUnitWeight1 = num2cell(newUnitWeight);

% handles.data_lab(:,7) = newCohesion1;
% handles.data_lab(:,5) = newUnitWeight1;