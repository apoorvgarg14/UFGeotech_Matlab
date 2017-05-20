function [phi]= cpt_frictionangle_GUI(Qt1,sigma_v1)

%============================units conversion==============================
if strcmpi(char(Qt1{1}),'tsf')
    Qt = cell2mat(Qt1(2:end));
elseif strcmpi(char(Qt1{1}),'ksf')
    for i = 2:length(Qt1)
    Qt(i-1,1) = (Qt1{i}/1000);
    end
elseif strcmpi(char(Qt1{1}),'psf')
    for i = 2:length(Qt1)
    Qt(i-1,1) = (Qt1{i}/1000000);
    end
elseif strcmpi(char(Qt1{1}),'kpa')
    for i = 2:length(Qt1)
    Qt(i-1,1) = (Qt1{i}*0.0104);
    end
elseif strcmpi(char(Qt1{1}(1)),'M')&&strcmpi(char(Qt1{1}(2)),'P')&&strcmpi(char(Qt1{1}(3)),'a')
    for i = 2:length(Qt1)
    Qt(i-1,1) = (Qt1{i}*10.442);
    end
elseif strcmpi(char(Qt1{1}),'kN/m2')
    for i = 2:length(Qt1)
    Qt(i-1,1) = (Qt1{i}*0.0104);
    end
elseif strcmpi(char(Qt1{1}),'N/mm2')
    for i = 2:length(Qt1)
    Qt(i-1,1) = (Qt1{i}*10.442);
    end
elseif strcmpi(char(Qt1{1}),'Select Unit')
    for i = 2:length(Qt1)
    Qt(i-1,1) = Qt1{i};
    end

end
for i = 2:length(sigma_v1)
    sigma_v(i-1,1) = sigma_v1{i};
end

if length(Qt1)==1||length(sigma_v1)==1
   phi =[]; 
    
else

Qt = Qt*0.096; %convert to MPa
sigma_v = sigma_v*0.048; %convert to kPa


m = sigma_v ./Qt;

for i2 = 1:length(m)
if (m(i2) <= 2.128)
    phi(i2) = 48;
elseif ((m(i2) >= 2.128)&&(m(i2)<=3.458))
    x = (m(i2)-2.128)*2;
    y = (3.458-2.128);
    phi(i2) = 48- (x/y);
elseif ((m(i2) >= 3.458)&&(m(i2)<=5.2511))
    x = m(i2)-3.458;
    y = (5.2511-3.458);
    phi(i2) = 46 - (2*x/y);
elseif((m(i2) >= 5.2511)&&(m(i2)<=7.8237))
    x = m(i2)-5.2511;
    y = (7.8237-5.2511);
    phi(i2) = 44-(2*x/y);
elseif((m(i2) >= 7.8237)&&(m(i2)<=11.32))
    x = m(i2)-7.8237;
    y = (11.32-7.8237);
    phi(i2) = 42 -(2*x/y);
elseif((m(i2) >= 11.32)&&(m(i2)<=16.051))
    x = m(i2)-11.32;
    y = (16.051-11.32);
    phi(i2) = 40 -(2*x/y);
elseif((m(i2) >= 16.051)&&(m(i2)<=23.374))
    x = m(i2)-16.051;
    y = (23.374-16.051);
    phi(i2) = 38 - (2*x/y);
elseif ((m(i2) >= 23.274)&&(m(i2)<=30.736))
    x = m(i2)-23.274;
    y = (30.736-23.274);
    phi(i2) = 36 - (2*x/y);
elseif ((m(i2) >= 30.736)&&(m(i2)<=41.042))
    x = m(i2)-30.736;
    y = (41.042-30.736);
    phi(i2) = 34 - (2*x/y);
elseif ((m(i2) >= 41.042)&&(m(i2)<=54.487))
    x = m(i2)-41.042;
    y = (54.487-41.042);
    phi(i2) = 32 - (2*x/y);
elseif (m(i2) >= 54.487)
    phi(i2) = 32;
    
end
end
end