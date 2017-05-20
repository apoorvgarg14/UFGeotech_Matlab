function [SoilType_CPT] = assignSoilType_CPT(SBT,DepthToBottomLayer,USCScode,PrimarySoilDesc )

if isempty(DepthToBottomLayer)
    
    if SBT ==1
        SoilType_CPT = 'CH';
    end
end

end