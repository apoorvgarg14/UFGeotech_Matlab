function [Dr] = Drvalue7(sigmath,N601)
if length(sigmath)==1||isempty(N601)
    Dr=[];
else
units = sigmath{1};
J = numel(N601)+1;
for i = 1 :J-1
    
    sigma1(i) = sigmath(i+1);
    
   
end;
sigma = cell2mat(sigma1);
N60 = (N601);

if (strcmpi(units,'MPa'))
    
    sigmaac = sigma./0.101325;
elseif (strcmpi(units,'ksf'))
    
    sigmaac = sigma./2.12;
elseif (strcmpi(units,'psf'))
    
    sigmaac = sigma./2116.2;
end
for i =1:numel(N601)
    x = 17+24*(sigmaac(i));
    Dr(i) = 100*(sqrt(N60(i)/x));
end
end
   
    
