function [FrictionAngle_CPT] = FrictionAngle_CPT_Qc(Qc,sigma_v)

%==========================================================================




%==========================================================================
for i = 1:length(Qc)

value(1) = sigma_v{i}-(3.8753*Qc{i});
value(2) = sigma_v{i}-(6.43*Qc{i});
value(3) = sigma_v{i}-(10.523*Qc{i});
value(4) = sigma_v{i}-(16.714*Qc{i});
value(5) = sigma_v{i}-(24.374*Qc{i});
value(6) = sigma_v{i}-(33.497*Qc{i});
value(7) = sigma_v{i}-(49.363*Qc{i});
value(8) = sigma_v{i}-(88.385*Qc{i});
value(9) = sigma_v{i}-(66.173*Qc{i});
value(10) = sigma_v{i}-(114.58*Qc{i});

angles = {48, 46,44,42,40,38,36,34,32,30};




[~,I] = min(abs(value));

FrictionAngle_CPT{i} = angles(I);

    
end
end


