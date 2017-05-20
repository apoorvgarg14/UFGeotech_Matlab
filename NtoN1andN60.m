function [N60,N1] = NtoN1andN60(SPT1,HammerType,sigma_v1)
%========================================================================
for i =2:length(SPT1)
    SPT(i-1) = SPT1{i};
end
%===========================================convert sigma_v1 here==========

for i = 2:length(sigma_v1)
sigma_v(i-1) = sigma_v1{i};
end
%=========================================================================

% SPT = SPT(~isnan(SPT));
%====================sigma_a units========================================
% if strcmpi(sigma_v1{1},'kPa')
% 
% sigma_a = 101.325; %in Kpa
% elseif strcmpi(sigma_v1{1},'lb/ft2')
    sigma_a = 2116.21;% in lb/ft2
% else
%     sigma_a = 101.325;
% end
%convert sigma_v to Kpa

if strcmpi(HammerType,'automatic hammer')
    N60 = 1.24*SPT;
    
else
    N60 = SPT;
    
end
Cn = 0.77*log10(40./(sigma_v./1000));
N1 = Cn.*N60;

end