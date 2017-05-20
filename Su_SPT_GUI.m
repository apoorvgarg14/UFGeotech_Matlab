function Su_SPT= Su_SPT_GUI(SPT1,USCSCode)
for i =2:length(SPT1)
    SPT(i-1) = SPT1{i};
end

if strcmpi(USCSCode,'CH')
    Su_SPT = 0.120*SPT;
elseif strcmpi(USCSCode,'CL')
    Su_SPT = 0.075*SPT;
elseif strcmpi(USCSCode,'SC-ML')
    Su_SPT = 0.038*SPT;
else
    Su_SPT = 0.066*SPT;
end