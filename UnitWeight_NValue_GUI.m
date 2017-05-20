function [UnitWeight1] =UnitWeight_NValue_GUI(SPT,SoilType,USCScode)


if length(SPT)==1
UnitWeight = [];
else

for i =2:length(SPT)
    SPT1(i-1) = SPT{i};
end    



for i = 1:length(SPT1)
if strcmpi(SoilType{i+1},'Clay')|| strcmpi (SoilType{i+1},'Silty Clay')||strcmpi(USCScode{i+1},'OH')||strcmpi(USCScode{i+1},'OL')||strcmpi(USCScode{i+1},'CH')||strcmpi(USCScode{i+1},'PT')||strcmpi(SoilType{i+1},'Sandy Clay')
    if SPT1(i)==0
       UnitWeight(i) = 100; 
    elseif (SPT1(i)>0 && SPT1(i)<=4)
       UnitWeight(i) = 100 +((110-100)*(SPT1(i)/4));
    elseif (SPT1(i)>4 && SPT1(i)<=10)
        UnitWeight(i) = 110 +(5*((SPT1(i)-4)/6));
    elseif (SPT1(i)>10 && SPT1(i)<=30)
        UnitWeight(i) = 115 +(5*(SPT1(i)-10)/20);
    elseif (SPT1(i)>30 && SPT1(i)<=50)
        UnitWeight(i) = 125;
    elseif (SPT1(i)>50)
        UnitWeight(i) = 125;
    end
elseif strcmpi(SoilType{i+1},'Silt') ||strcmpi(USCScode{i+1},'CL-ML')||strcmpi(USCScode{i+1},'CL')||strcmpi(USCScode{i+1},'ML')||strcmpi(USCScode{i+1},'SM-ML')||strcmpi(USCScode{i+1},'MH')|| strcmpi(SoilType{i+1},'Sandy Silt')|| strcmpi(SoilType{i+1},'Clayey Silt')|| strcmpi(SoilType{i+1},'Organic Silt')
    if SPT1(i)==0
       UnitWeight(i) = 100; 
    elseif (SPT1(i)>0 && SPT1(i)<=4)
       UnitWeight(i) = 100 +((110-100)*(SPT1(i)/4));
    elseif (SPT1(i)>4 && SPT1(i)<=10)
        UnitWeight(i) = 110 +(5*((SPT1(i)-4)/6));
    elseif (SPT1(i)>10 && SPT1(i)<=30)
        UnitWeight(i) = 115 +(5*(SPT1(i)-10)/20);
    elseif (SPT1(i)>30 && SPT1(i)<=50)
        UnitWeight(i) = 125;
    elseif (SPT1(i)>50)
        UnitWeight(i) = 125;
    end
elseif strcmpi(SoilType{i+1},'Sand')|| strcmpi(SoilType{i+1},'Silty Sand')||strcmpi(USCScode{i+1},'SC')||strcmpi(USCScode{i+1},'SM')||strcmpi(USCScode{i+1},'SP')||strcmpi(USCScode{i+1},'SW')||strcmpi(USCScode{i+1},'SC-SM')||strcmpi(USCScode{i+1},'SW-SM')||strcmpi(USCScode{i+1},'SW-SC')||strcmpi(USCScode{i+1},'SP-SM')||strcmpi(USCScode{i+1},'SP-SC')||strcmpi(USCScode{i+1},'Clayey Sand')||strcmpi(USCScode{i+1},'Gravelly Sand')
    if SPT1(i)==0
       UnitWeight(i) = 105;
    elseif (SPT1(i)>0 && SPT1(i)<=4)
       UnitWeight(i) = 105 +((115-105)*(SPT1(i)/4));
    elseif (SPT1(i)>4 && SPT1(i)<=10)
        UnitWeight(i) = 115 +(5*((SPT1(i)-4)/6));
    elseif (SPT1(i)>10 && SPT1(i)<=30)
        UnitWeight(i) = 120; 
    elseif (SPT1(i)>30 && SPT1(i)<=50)
        UnitWeight(i) = 125;
    elseif (SPT1(i)>50)
        UnitWeight(i) = 135;
    end
elseif strcmpi(SoilType{i+1},'Gravel')||strcmpi(USCScode{i+1},'GC')||strcmpi(USCScode{i+1},'GM')||strcmpi(USCScode{i+1},'GP')||strcmpi(USCScode{i+1},'GW')||strcmpi(USCScode{i+1},'GW-GM')||strcmpi(USCScode{i+1},'GW-GC')||strcmpi(USCScode{i+1},'GP-GM')||strcmpi(USCScode{i+1},'GP-GC')||strcmpi(USCScode{i+1},'GC-GW')||strcmpi(USCScode{i+1},'LimeStone')
   
    if (SPT1(i)>0 && SPT1(i)<=4)
       UnitWeight(i) = 115;
    elseif (SPT1(i)>4 && SPT1(i)<=10)
        UnitWeight(i) = 115 +(10*((SPT1(i)-4)/6));
    elseif (SPT1(i)>10 && SPT1(i)<=30)
        UnitWeight(i) = 125 +(10*(SPT1(i)-10)/20);
    elseif (SPT1(i)>30 && SPT1(i)<=50)
        UnitWeight(i) = 140;
    elseif (SPT1(i)>50)
        UnitWeight(i) = 145;
    end
elseif strcmpi(SoilType{i+1},'Debris/Trash')
    UnitWeight(i) = 70;
end

end
end
units ={'pcf'};
UnitWeight1 = [units;num2cell(UnitWeight')];

end
