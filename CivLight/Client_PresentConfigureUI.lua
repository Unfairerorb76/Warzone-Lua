function Client_PresentConfigureUI(rootParent, rootParent2, rootParent3)
	
	local initialValueConvert = Mod.Settings.NumToConvert;
	local initialValueArmies = Mod.Settings.SetArmiesTo;
        local initalcheckbox = Mod.Settings.OnlyBaseNeutrals;
	
	local initialVillages = Mod.Settings.NumOfVillages;
	local ON = Mod.Settings.ONeutrals;
	local GainedArmies = Mod.Settings.Armies;
	
	
	if initialValueConvert == nil then
		initialValueConvert = 2;
	end
	
	if initialValueArmies == nil then
		initialValueArmies = 2;
	end

        if initalcheckbox == nil then 
                initalcheckbox = false; 
        end
	
	if initialVillages == nil then
		initialVillages = 3;
	end
	if ON == nil then 
                ON = true; 
        end
	if GainedArmies == nil then
		GainedArmies = 2;
	end
    
 local vert = UI.CreateVerticalLayoutGroup(rootParent);
local horz1 = UI.CreateHorizontalLayoutGroup(vert);  --not used
local horz2 = UI.CreateHorizontalLayoutGroup(vert);  --not used but here for reference
	
	UI.CreateLabel(vert).SetText('Expansion+ Mod related:');
	
	UI.CreateLabel(vert).SetText('amount of neutrals a player shall gain each turn');
    numberInputField = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(10)
		.SetValue(initialValueConvert);
	
	 UI.CreateLabel(vert).SetText('amount of armies a player shall get with the territory');
    numberInputField2 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(10)
		.SetValue(initialValueArmies); 
 
        UI.CreateLabel(vert).SetText('only base neutral armies and less shall be claimed');
        booleanInputField = UI.CreateCheckBox(vert)        
                .SetIsChecked(initalcheckbox);
	
	UI.CreateLabel(vert).SetText('Village Mod related:');
	
	UI.CreateLabel(vert).SetText('Amount of Villages that will be created at the start of the game');
   	 numberInputField = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(10)
		.SetValue(initialVillages);
	
	UI.CreateLabel(vert).SetText('Amount of armies that you will get with each new territory');
   	 numberInputField2 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(15)
		.SetValue(GainedArmies);
	
	UI.CreateLabel(vert).SetText('only neutrals territories shall be claimed (recommended)');
        booleanInputField = UI.CreateCheckBox(vert)        
                .SetIsChecked(ON);
	
	
        UI.CreateLabel(vert).SetText('Army-Cache Mod related:');      

end
