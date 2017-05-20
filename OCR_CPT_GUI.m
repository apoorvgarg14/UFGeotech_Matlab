function [OCR_CPT]= OCR_CPT_GUI(qc1,qt1,sigma_v1)

for i1 = 2:length(sigma_v1)
sigma_v(i1-1) = sigma_v1{i1};
end


%==========================================units==========================
if strcmpi(qt1{1},'tsf')
for i1 = 2:length(qt1)
qt(i1-1) = qt1{i1}*2000;
end
elseif strcmpi(qt1{1},'ksf')
for i1 = 2:length(qt1)
qt(i1-1) = qt1{i1}*1000;
end 
elseif strcmpi(qt1{1},'psf')
for i1 = 2:length(qt1)
qt(i1-1) = qt1{i1}*1;
end 
elseif strcmpi(char(qt1{1}(1)),'M')&& strcmpi(char(qt1{1}(2)),'P')&& strcmpi(char(qt1{1}(3)),'a')
for i1 = 2:length(qt1)
qt(i1-1) = qt1{i1}*20885.434;
end 
end

if strcmpi(qc1{1},'tsf')
for i1 = 2:length(qc1)
qc(i1-1) = qc1{i1}*2000;
end
elseif strcmpi(qc1{1},'ksf')
for i1 = 2:length(qc1)
qc(i1-1) = qc1{i1}*1000;
end 
elseif strcmpi(qc1{1},'psf')
for i1 = 2:length(qc1)
qc(i1-1) = qc1{i1}*1;
end 
elseif strcmpi(qc1{1}(1),'M')&&strcmpi(qc1{1}(2),'P')&&strcmpi(qc1{1}(3),'a')
for i1 = 2:length(qc1)
qc(i1-1) = qc1{i1}*20885.434;
end 
end
%==========================================================================
if (length(qt1)==1)
qt=qc;
end

if length(sigma_v1)==1
    
    OCR_CPT =[];
else

for i = 1:length(sigma_v)
    sigma_p(i) = (0.33*(qt(i)-sigma_v(i)));
OCR_CPT(i,1) = sigma_p(i)/sigma_v(i);
end
end
end