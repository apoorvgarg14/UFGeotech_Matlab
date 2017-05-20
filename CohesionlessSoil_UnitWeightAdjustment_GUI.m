function LabUnitWeight_adjustedCohesionless = CohesionlessSoil_UnitWeightAdjustment_GUI(Lab_UnitWeight,Project,i,Lab_MajorSoilType)
nestedStructure = fieldnames(Project);

A = Project.(nestedStructure{i}).USCScode;
B = Project.(nestedStructure{i}).FieldBlowCount;
B(isnan(B))=[];
C = Project.(nestedStructure{i}).SoilLayerNumber;
C(isnan(C))=[];

D = A(C);


E = checkMajorSoilType_GUI(D);

F = find(strcmp(E,'Cohesionless'));
G = B(F);

avgSPT = mean(G);
H=UnitWeight_SPT_GUI(avgSPT,D(2)); 



 Lab_UnitWeight(Lab_UnitWeight==0)=H;
 
 LabUnitWeight_adjustedCohesionless = Lab_UnitWeight;

 