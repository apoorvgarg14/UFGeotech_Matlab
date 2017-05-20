function [outputInfeet] = convertTofeet(inputInany)


if strcmpi(inputInany{1},'feet')
    outputInfeet = inputInany;
elseif strcmpi(inputInany{1},'inches')
    outputInfeet{1,1} = 'feet';
    for i = 2:length(inputInany)
       outputInfeet{i,1} = inputInany{i}/12; 
    end
elseif strcmpi(inputInany{1},'meters')
    outputInfeet{1,1} = 'feet';
    for i = 2:length(inputInany)
       outputInfeet{i,1} = 3.28*inputInany{i}; 
    end
elseif strcmpi(inputInany{1},'Select Unit')
    outputInfeet = inputInany;
end
    
end