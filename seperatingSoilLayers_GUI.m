A = handles.data_lab(:,3);
B= cell2mat(handles.data_lab(:,7));
C = cell2mat(handles.data_lab(:,1));
D = cell2mat(handles.data_lab(:,5));
m=1;
k=1;
SoilLayer{1,1} = cellstr(A{1});
Cohesion_Distributed{m,k} = B(1);
Depth_Lab_Distributed{1,1} = C(1);
UnitWeight_Lab_Distributed{1,1}=D(1);
for i = 2:length(A)
    if (strcmp(A{i},A{i-1}))
    m = m+1;
        SoilLayer{m,k} = A(i);
        Cohesion_Distributed{m,k} = B(i);
        Depth_Lab_Distributed{m,k}= C(i);
        UnitWeight_Lab_Distributed{m,k}=D(i);
    else k = k+1;
        m= 1;
        SoilLayer{m,k}= A(i);
        Cohesion_Distributed{m,k} = B(i);
        Depth_Lab_Distributed{m,k}= C(i);
        UnitWeight_Lab_Distributed{m,k}=D(i);
    end
    
    
end
