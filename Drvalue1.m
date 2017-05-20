function [Dr] = Drvalue1(sigmath,Qt,Qc)
if length(sigmath)==1||(length(Qt)==1&&length(Qc)==1)

   Dr = []; 
else
    if length(Qt)==1
        Qt = Qc;
    end
units = Qt{1};
J = numel(sigmath);
k = J-1;

for i = 1 :J-1
    qt1(i) = Qt(i+1);
    sigma1(i) = sigmath(i+1);
   
    qt = cell2mat(qt1);
end
 sigma = cell2mat(sigma1);
if strcmpi(char(units(1)),'M')&&strcmpi(char(units(2)),'P')&&strcmpi(char(units(3)),'a')
    
    sigmaac = sigma.*0.0478802588889;
    QT = qt.*1000;
elseif (strcmpi(units,'tsf'))
   QT = (qt.*95.76);
    sigmaac = (sigma.*0.0478802588889); 
elseif (strcmpi(units,'ksf'))
   QT = qt./0.020885434273;
    sigmaac = sigma.*0.0478802588889;
elseif (strcmpi(units,'psf'))
    QT = qt.*0.0478802588889;
    sigmaac = sigma.*0.0478802588889;
end
for i =1:k
    X = 1/3.29;
    Y = QT(i)/(86*(sigmaac(i)^0.53));
    
    Dr(i) = 100*X*log(Y);
end
end