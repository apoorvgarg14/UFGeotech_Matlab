A = Cohesion_Final;
B = SoilLayer;
[M, N] = size(A);
for i = 1:N
     D = Cohesion_Distributed(:,i); 
    C1{i}= D(~cellfun('isempty',D));  
    if (i == 1||2)
    if (isempty(A{1,i})&& strcmp(SoilLayer{1,i},SoilLayer{1,i+2}))
        
     for k = 1:length(C1{i})
        Cohesion_Final{k,i} = Cohesion_Final{1,i+2};
     end
    end
    elseif (i == (N-1)||(N-2))
    if (isempty(A{1,i}) && strcmp(SoilLayer{1,i},SoilLayer{1,i-2}))
    
    for k = 1:length(C1{i})
        Cohesion_Final{k,i} = Cohesion_Final{1,i-2};
     end
    end
    else
if (isempty(A{1,i}) && strcmp(SoilLayer{1,i},SoilLayer{1,i-2}))
    
    for k = 1:length(C1{i})
        Cohesion_Final{k,i} = Cohesion_Final{1,i-2};
     end
    
elseif (isempty(A{1,i}) && strcmp(SoilLayer{1,i},SoilLayer{1,i+2}))
    
    for k = 1:length(C1{i})
        Cohesion_Final{k,i} = Cohesion_Final{1,i+2};
     end
    
end
    end

end
