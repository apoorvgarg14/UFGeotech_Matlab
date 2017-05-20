function [UnitWeight_CPT,FrictionRatio_final]= UnitWeight_CPT_GUI(FrictionRatio1, Qc1,Qt1,Fs1)

if strcmpi(char(Qt1{1}),'tsf')
    Qt = cell2mat(Qt1(2:end));
elseif strcmpi(char(Qt1{1}),'ksf')
    for i = 2:length(Qt1)
    Qt(i-1) = (Qt1{i}/1000);
    end
elseif strcmpi(char(Qt1{1}),'psf')
    for i = 2:length(Qt1)
    Qt(i-1) = (Qt1{i}/1000000);
    end
elseif strcmpi(char(Qt1{1}),'kpa')
    for i = 2:length(Qt1)
    Qt(i-1) = (Qt1{i}*0.0104);
    end
elseif strcmpi(char(Qt1{1}(1)),'M')&& strcmpi(char(Qt1{1}(2)),'P')&& strcmpi(char(Qt1{1}(3)),'a') 
    for i = 2:length(Qt1)
    Qt(i-1) = (Qt1{i}*10.442);
    end
elseif strcmpi(char(Qt1{1}),'kN/m2')
    for i = 2:length(Qt1)
    Qt(i-1) = (Qt1{i}*0.0104);
    end
elseif strcmpi(char(Qt1{1}),'N/mm2')
    for i = 2:length(Qt1)
    Qt(i-1) = (Qt1{i}*10.442);
    end
elseif strcmpi(char(Qt1{1}),'Select Unit')
    for i = 2:length(Qt1)
    Qt(i-1) = Qt1{i};
    end

end
if (length(Qt1)==1)
    Qt = [];
end

if strcmpi(char(Qc1{1}),'tsf')
    Qc = cell2mat(Qc1(2:end));
elseif strcmpi(Qc1{1},'ksf')
    for i = 2:length(Qc1)
    Qc(i-1) = (Qc1{i}/1000);
    end
elseif strcmpi(char(Qc1{1}),'psf')
    for i = 2:length(Qc1)
    Qc(i-1) = (Qc1{i}/1000000);
    end
elseif strcmpi(char(Qc1{1}),'kpa')
    for i = 2:length(Qc1)
    Qc(i-1) = (Qc1{i}*0.0104);
    end
elseif strcmpi((Qc1{1}(1)),'M') && strcmpi(Qc1{1}(2),'P') && strcmpi(Qc1{1}(3),'a')
    for i = 2:length(Qc1)
    Qc(i-1) = (Qc1{i}*10.442);
    end
elseif strcmpi(char(Qc1{1}),'kN/m2')
    for i = 2:length(Qc1)
    Qc(i-1) = (Qc1{i}*0.0104);
    end
elseif strcmpi(char(Qc1{1}),'N/mm2')
    for i = 2:length(Qc1)
    Qc(i-1) = (Qc1{i}*10.442);
    end
    elseif strcmpi(char(Qc1{1}),'Select Unit')
    for i = 2:length(Qc1)
    Qc(i-1) = Qc1{i};
    end
end
if (length(Qc1)==1)
    Qc = [];
end
if (length(FrictionRatio1)==1)
    FrictionRatio =[];
end
if (length(Fs1)==1)
    Fs = [];
end

for i = 2:length(FrictionRatio1)
   FrictionRatio(i-1) = FrictionRatio1{i};  
   
end
for i1 = 2:length(Fs1)
    Fs(i1-1,1) = Fs1{i1};
end

if isempty(FrictionRatio) && isempty(Fs)
    UnitWeight_CPT = [];
    FrictionRatio_final ={'(-)'};
else

Pa = 1.06; % in tsf
Gs = 2.65;
UnitWeight_water = 62.4;%in pcf
%function of Gs to be determined here
if isempty(Qt)
Qt = Qc;    
end

if isempty(FrictionRatio)
    for i6 = 1:length(Fs)
    FrictionRatio(1,i6) = Fs(i6)/Qt(i6);
    end
end


for i2 = 1:length(FrictionRatio)
UnitWeight_CPT(i2,1) = (((0.27*log10(FrictionRatio(i2)))+0.36*(log10(Qt(i2)/Pa))+1.236)*(Gs/2.65))*UnitWeight_water;
end

FrictionRatio_final = ['(-)';num2cell(FrictionRatio')];
end
