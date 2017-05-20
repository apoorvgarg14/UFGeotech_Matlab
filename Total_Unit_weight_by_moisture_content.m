function estimated_total_unit_weight = Total_Unit_weight_by_moisture_content(w_n,soil_classification,soil_primary_description)

gamma_water = 62.4;  %%unit in pcf

degree_of_saturation = 1; %%assumed to be 1 for the whole soil profile due to a high elevation of water table and soil type 

%%define specific gravity
if  strcmpi(soil_classification,'GW') || strcmpi(soil_classification,'GP') || strcmpi(soil_classification,'GW-GM')...
        || strcmpi(soil_classification,'GW-GC') || strcmpi(soil_classification,'GP-GM') || strcmpi(soil_classification,'GP-GC')
            Specific_gravity = 2.63;
    elseif strcmpi(soil_classification,'GM')
            Specific_gravity = 2.65;
    elseif strcmpi(soil_classification,'GC')
            Specific_gravity = 2.67;
    elseif strcmpi(soil_classification,'SW') || strcmpi(soil_classification,'SP') || strcmpi(soil_classification,'SW-SM')...
        || strcmpi(soil_classification,'SW-SC') || strcmpi(soil_classification,'SP-SM') || strcmpi(soil_classification,'SP-SC')
            Specific_gravity = 2.65;
    elseif strcmpi(soil_classification,'SM') || strcmpi(soil_classification,'SM-ML')
            Specific_gravity = 2.69;
    elseif strcmpi(soil_classification,'SC')
            Specific_gravity = 2.67;
    elseif strcmpi(soil_classification,'CL') || strcmpi(soil_classification,'CL-CH') || strcmpi(soil_classification,'CL-OL')...
        || strcmpi(soil_classification,'CH') || strcmpi(soil_classification,'CH-MH')
            Specific_gravity = 2.75;
    elseif strcmpi(soil_classification,'CL-ML')
            Specific_gravity = 2.73;
    elseif strcmpi(soil_classification,'ML') || strcmpi(soil_classification,'MH')
            Specific_gravity = 2.68;
    elseif strcmpi(soil_classification,'OL')
            Specific_gravity = 2.50;
    elseif strcmpi(soil_classification,'OH')
            Specific_gravity = 2.60;
    elseif strcmpi(soil_classification,'PT')
            Specific_gravity = 1.60;
    elseif strcmpi(soil_classification,'ROCK')
            Specific_gravity = 2.80;
else if strcmpi(soil_primary_description,'Sand')
        Specific_gravity = 2.65;
    elseif strcmpi(soil_primary_description,'Clayey Sand')
        Specific_gravity = 2.67;
    elseif strcmpi(soil_primary_description,'Gravelly Sand')
        Specific_gravity = 2.63;
    elseif strcmpi(soil_primary_description,'Silty Sand')
        Specific_gravity = 2.66;
    elseif strcmpi(soil_primary_description,'Silt')
        Specific_gravity = 2.68;
    elseif strcmpi(soil_primary_description,'Clayey Silt')
        Specific_gravity = 2.70;
    elseif strcmpi(soil_primary_description,'Gravelly Silt')
        Specific_gravity = 2.65;
    elseif strcmpi(soil_primary_description,'Organic Silt')
        Specific_gravity = 2.50;
    elseif strcmpi(soil_primary_description,'Sandy Silt')
        Specific_gravity = 2.66;
    elseif strcmpi(soil_primary_description,'Clay')
        Specific_gravity = 2.75;
    elseif strcmpi(soil_primary_description,'Gravelly Clay')
        Specific_gravity = 2.68;
    elseif strcmpi(soil_primary_description,'Organic Clay')
        Specific_gravity = 2.60;
    elseif strcmpi(soil_primary_description,'Sandy Clay')
        Specific_gravity = 2.69;
    elseif strcmpi(soil_primary_description,'Silty Clay')
        Specific_gravity = 2.73;
    elseif strcmpi(soil_primary_description,'Gravel') || strcmpi(soil_primary_description,'Sandy Gravel')
        Specific_gravity = 2.63;
    elseif strcmpi(soil_primary_description,'Clayey Gravel')
        Specific_gravity = 2.67;
    elseif strcmpi(soil_primary_description,'Silty Gravel')
        Specific_gravity = 2.65;
    elseif strcmpi(soil_primary_description,'No Sample')
        Specific_gravity = 0;
    elseif strcmpi(soil_primary_description,'Void')
        Specific_gravity = 0;
    elseif strcmpi(soil_primary_description,'Peat')
        Specific_gravity = 1.6;
    elseif strcmpi(soil_primary_description,'Rock')
        Specific_gravity = 2.8;
    elseif strcmpi(soil_primary_description,'Sandstone')
        Specific_gravity = 2.8;
    elseif strcmpi(soil_primary_description,'Siltstone')
        Specific_gravity = 2.8;
    elseif strcmpi(soil_primary_description,'Debris/Trash')
        Specific_gravity = 0;
    elseif strcmpi(soil_primary_description,'Weathered Rock')
        Specific_gravity = 2.8;
    elseif strcmpi(soil_primary_description,'Limestone')
        Specific_gravity = 2.8;
    else
        Specific_gravity = NaN;
    end
end
estimated_total_unit_weight = (1+w_n/100)*Specific_gravity*degree_of_saturation*gamma_water/(degree_of_saturation+Specific_gravity*w_n/100); %% unit in pcf

    
