A = handles.Project_CPT;

nestedStructure_CPT = fieldnames(A);
B = nestedStructure_CPT{2};
E = Depth_Lab_Distributed;
C = Cohesion_Final;
D = A.(B).Depth(2:3000);
F = A.(B).Cohesion(2:3000);
R = D(~cellfun('isempty',D));
R1 = F(~cellfun('isempty',F));
[M,N] = size(C);
for k = 1:M;
    for m = 1:N;
if C{k,m}==0
[value, index] = min(abs(E{k,m}-cell2mat(R)));
if value >0.05
    continue
else 
    Cohesion_Final{k,m} = R1{index};
end
end
    

    end
end
