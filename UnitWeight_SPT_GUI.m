function[Gamma]=UnitWeight_SPT_GUI(SPT_Data,Soil_Type)


[L,M] = size(SPT_Data);

for i=1:L
    for j=1:M     
       if strcmp(Soil_Type{i,j},'GW') || strcmp(Soil_Type{i,j},'GP') || strcmp(Soil_Type{i,j},'GM')...
               || strcmp(Soil_Type{i,j},'GC')|| strcmp(Soil_Type{i,j},'SW') || strcmp(Soil_Type{i,j},'SP') ||...
                strcmp(Soil_Type{i,j},'SM') || strcmp(Soil_Type{i,j},'SC')|| strcmp(Soil_Type{i,j},'Sand') || strcmp(Soil_Type{i,j},'Silty Sand')
%             Sand_SPT(i,j) = SPT_Data(i,j);
            
            if SPT_Data(i,j) <= 4
                Gamma(i,j)=90;
            elseif SPT_Data(i,j)>4 && SPT_Data(i,j)<=50
                Gamma(i,j)=1.0869.*(SPT_Data(i,j)-4)+90;
            else 
                Gamma(i,j)=140;
            end    
  
       elseif strcmp(Soil_Type{i,j},'ML') || strcmp(Soil_Type{i,j},'CL') || strcmp(Soil_Type{i,j},'OL')...
               || strcmp(Soil_Type{i,j},'MH') || strcmp(Soil_Type{i,j},'CH') || strcmp(Soil_Type{i,j},'OH')...
               || strcmp(Soil_Type{i,j},'PT') || strcmp(Soil_Type{i,j},'Clay')
%             Rock_SPT(i,j) = SPT_Data(i,j);
            
            if SPT_Data(i,j)<=2
                Gamma(i,j)=100;
            elseif SPT_Data(i,j)>2 && SPT_Data(i,j)<15
                Gamma(i,j)=3.0769.*(SPT_Data(i,j)-2)+100;
            else 
                Gamma(i,j)=140;
            end               
            
            
    
        end

    end
end
clearvars L M;
end
