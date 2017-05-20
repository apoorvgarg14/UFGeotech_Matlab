function  [projectcoded] = assignPrimarySoil_CPT_GUI(project)
names =  fieldnames(project);


 for i = 1:length(names)
     Code =[];
     Code1 = [];
     
current = names{i};
D1 = project.(current).Depth;
D = D1(~cellfun('isempty',D1)); 

G1 = project.(current).DepthToBottomLayer;
G = G1(~cellfun('isempty',G1));

P1 = project.(current).PrimarySoilDesc;
P =  P1(~cellfun('isempty',P1));
Depth = [];
GenDepthToBoring = [];
PrimarySoilDesc =[];

% for i3 = 2:length(D)
% Depth(i3-1) = [D{i3}];
% end
% for i4 = 2:length(G)
% GenDepthToBoring(i4-1) = [G{i4}];
% end

for i5 = 2:length(P)
PrimarySoilDesc{i5-1} = [P{i5}];
end

%=========================Units Conversion=======================================

if strcmpi(G{1},'feet')
    GenDepthToBoring = cell2mat(G(2:end));
elseif strcmpi(G{1},'meters')
    for i = 2:length(G)
    GenDepthToBoring(i-1) = (G{i}*3.28);
    end
elseif strcmpi(G{1},'inches')
    for i = 2:length(G)
    GenDepthToBoring(i-1) = (G{i}/12);
    end
end

if strcmpi(D{1},'feet')
    Depth = cell2mat(D(2:end));
elseif strcmpi(D{1},'meters')
    for i = 2:length(D)
    Depth(i-1) = (D{i}*3.28);
    end
elseif strcmpi(D{1},'inches')
    for i = 2:length(D)
    Depth(i-1) = (D{i}/12);
    end
end




%==========================================================================
SBT = [project.(current).SoilBehaviorType(2:end)];
% GenDepthToBoring = [project.(current).DepthToBottomLayer{2:end}];
USCScode = project.(current).USCScode(2:end);
% PrimarySoilDesc = project.(current).PrimarySoilDesc(2:end);
SecondarySoilDesc = project.(current).SecondarySoilDesc(2:end);



  for T = 1:length(Depth)
   if isequal(SBT{T},1)
      Code{T,1} = 'PT';
      Code1{T,1} = 'Clay';
   elseif isequal(SBT{T},2)
       Code{T,1} = 'OH';
       Code1{T,1} = 'Clay';
   elseif isequal(SBT{T},3)
       Code{T,1} = 'CH';
       Code1{T,1} = 'Clay';
   elseif isequal(SBT{T},4)
       Code{T,1} = 'CL';
       Code1{T,1} = 'Silt';
   elseif isequal(SBT{T},5)
       Code{T,1} = 'SM';
       Code1{T,1} = 'Silt';
   elseif isequal(SBT{T},6)
       Code{T,1} = 'SC';
       Code1{T,1} = 'Silt';
   elseif isequal(SBT{T},7)
       Code{T,1} = 'SW';
       Code1{T,1} = 'Sand';
   elseif isequal(SBT{T},8)
       Code{T,1} = 'ML';
       Code1{T,1} = 'Sand';
   elseif isequal(SBT{T},2)
       Code{T,1} = 'GW';
       Code1{T,1} = 'Sand';
   elseif isempty(SBT{T})
       
   
            x = Depth(T);
     for h = 1 :length(GenDepthToBoring)-1
        if ((x>0)&&(x<= GenDepthToBoring(1)))
             if strcmpi(USCScode{T},'Select')    
            Code{T,1} = PrimarySoilDesc(1);
            Code1{T,1} = PrimarySoilDesc(1);
             else
                 Code{T,1} = USCScode(1);
                 Code1{T,1} = PrimarySoilDesc(1);
             end
             elseif ((x>GenDepthToBoring(h)&&(x<=GenDepthToBoring(h+1))))
            try
                if strcmpi(USCScode{T},'Select')
            Code{T,1} = PrimarySoilDesc(h+1);
            Code1{T,1} = PrimarySoilDesc(h+1);
                else
                    Code{T,1} = USCScode(h+1);
                    Code1{T,1} = PrimarySoilDesc(h+1);
                end
            catch
                if strcmpi(USCScode{T},'Select')
                Code{T,1} = PrimarySoilDesc(length(PrimarySoilDesc));
                Code1{T,1} = PrimarySoilDesc(length(PrimarySoilDesc));
                else
                    Code{T,1} = USCScode(length(USCScode));
                    Code1{T,1} = PrimarySoilDesc(length(PrimarySoilDesc));
                end
            end
        elseif (isnan(x))
            continue
        end
     end
   end
  end
projectcoded.(current).SoilAssignment_Elevation = Code;
projectcoded.(current).PrimarySoilDescAssignment_Elevation = Code1;

  

 end
 
 end  

    