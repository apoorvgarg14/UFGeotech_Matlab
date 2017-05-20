function [SU_SPT_OCR] = SU_SPT_OCR_GUI(OCR,sigma_v1)

for i = 2:length(sigma_v1)
sigma_v(i-1) = sigma_v1{i};
end

SU_SPT_OCR = ((0.23*(OCR.^0.80)).*sigma_v)/2000;

end