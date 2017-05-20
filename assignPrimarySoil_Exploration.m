function  [projectcoded] = assignPrimarySoil_Exploration(project)
names =  fieldnames(project);

 for i = 1:length(names)
     Code =[];
     Code1 = [];
current = names{i};

Depth = [project.(current).Depth];

GenSoilLayer = [project.(current).GenSoilLayer];
GenDepthToBoring = [project.(current).GenDepthToBoring];
USCScode = project.(current).USCScode;
PrimarySoilDesc = project.(current).PrimarySoilDesc;
SecondarySoilDesc = project.(current).SecondarySoilDesc;



  for T = 1:length(Depth)
   
      
    x = Depth(T);
     for h = 1 :length(GenDepthToBoring)
        if ((x>0)&&(x<= GenDepthToBoring(1)))
             if strcmpi(USCScode{h},'Select')    
            Code{T,1} = PrimarySoilDesc(1);
            Code1{T,1} = PrimarySoilDesc(1);
             else
                 Code{T,1} = USCScode(1);
                 Code1{T,1} = PrimarySoilDesc(1);
             end
             elseif ((x>GenDepthToBoring(h)&&(x<=GenDepthToBoring(h+1))))
            try
                if strcmpi(USCScode{h},'Select')
            Code{T,1} = PrimarySoilDesc(h+1);
            Code1{T,1} = PrimarySoilDesc(h+1);
                else
                    Code{T,1} = USCScode(h+1);
                    Code1{T,1} = PrimarySoilDesc(h+1);
                end
            catch
                if strcmpi(USCScode{h},'Select')
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
  
projectcoded.(current).SoilAssignment_Elevation = Code;
projectcoded.(current).PrimarySoilDescAssignment_Elevation = Code1;

  

 end
 
 end  
end
    