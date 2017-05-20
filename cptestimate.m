function phi= cptestimate(Qc1,sigma_v)
% a = cell2mat(QC(2:end));
% B = cell2mat(Qt(2:end));
% if(isempty(B))
%     Qc1 = QC;
% else
%     Qc1 = Qt;
% end
%=============================unit coversion=========================
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
else
    for i = 2:length(Qc1)
    Qc(i-1) = Qc1{i};
    end
end
sigmav = cell2mat(sigma_v(2:end));
for i = 1:length(sigmav)
Qc(i) = Qc(i)*0.98; %convert to kgf/cm2





m = sigmav(i) /Qc(i);
if ((m <= 3.875))
    phi(i) = 48;

elseif ((m >= 3.8753)&&(m<=6.43))
    x = (m-3.8753)*2;
    y = (6.43-3.8753);
    phi(i) = 48- (x/y);
elseif ((m >= 6.43)&&(m<=10.523))
    x = m-6.43;
    y = (10.523-6.43);
    phi(i) = 46 - (2*x/y);
elseif((m >= 10.523)&&(m<=16.714))
    x = m-10.523;
    y = (16.714-10.523);
    phi(i) = 44-(2*x/y);
elseif((m >= 16.6714)&&(m<=24.374))
    x = m-16.6714;
    y = (24.374-16.6714);
    phi(i) = 42 -(2*x/y);
elseif((m >= 24.374)&&(m<=33.497))
    x = m-24.374;
    y = (33.497-24.374);
    phi(i) = 40 -(2*x/y);
elseif((m >= 33.497)&&(m<=49.363))
    x = m-33.497;
    y = (49.363-33.497);
    phi(i) = 38 - (2*x/y);
elseif ((m >= 49.363)&&(m<=66.173))
    x = m-49.363;
    y = (66.173-49.363);
    phi(i) = 36 - (2*x/y);
elseif ((m >= 66.173)&&(m<=88.385))
    x = m-66.713;
    y = (88.385-66.173);
    phi(i) = 34 - (2*x/y);
elseif ((m >= 88.385)&&(m<=114.58))
    x = m-88.385;
    y = (114.58-88.385);
    phi(i) = 32 - (2*x/y);
else
    phi(i) = 30;
   
end
end