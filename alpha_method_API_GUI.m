function qs=alpha_method_API_GUI(Su,Sigma_o)

phi=Su./Sigma_o;
if phi<=1
alpha=0.5.*phi.^(-0.5);
else
alpha=0.5.*phi.^(-0.25);
end
qs=alpha.*Su;
