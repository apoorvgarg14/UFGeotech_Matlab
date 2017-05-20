function [FrictionAngle_CPT] = FrictionAngle_CPT_Qt(Qt,sigma_v)
for i = 1:length(Qt)

value(1) = sigma_v{i}-(2.128*Qt{i});
value(2) = sigma_v{i}-(3.458*Qt{i});
value(3) = sigma_v{i}-(5.2511*Qt{i});
value(4) = sigma_v{i}-(7.8237*Qt{i});
value(5) = sigma_v{i}-(11.32*Qt{i});
value(6) = sigma_v{i}-(16.051*Qt{i});
value(7) = sigma_v{i}-(22.374*Qt{i});
value(8) = sigma_v{i}-(41.042*Qt{i});
value(9) = sigma_v{i}-(30.736*Qt{i});
value(10) = sigma_v{i}-(54.847*Qt{i});

angles = {48, 46,44,42,40,38,36,34,32,30};




[~,I] = min(abs(value));

FrictionAngle_CPT{i} = angles(I);

    
end
end