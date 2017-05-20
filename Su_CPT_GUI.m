function Su_CPT=Su_CPT_GUI(OCR_CPT,sigma_v1)
if length(sigma_v1)==1
    Su_CPT =[];
else

for i1 = 2:length(sigma_v1)
sigma_v(i1-1) = sigma_v1{i1};
end

Su_CPT=(0.23.*(OCR_CPT.^0.8).*sigma_v);

end
end