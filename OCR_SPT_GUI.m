function OCR_SPT = OCR_SPT_GUI(N60,sigma_v1)

%===========================================convert sigma_v1 here==========

for i = 2:length(sigma_v1)
sigma_v(i-1) = sigma_v1{i};
end

sigma_v_mpa = 0.0000478.*sigma_v;
for i = 1:length(sigma_v_mpa)
OCR_SPT(i) = (0.193*((N60(i)/sigma_v_mpa(i))^0.689));
end

for i = 1:length(OCR_SPT)
if OCR_SPT(i)>10
    OCR_SPT(i) = 10;
end
end