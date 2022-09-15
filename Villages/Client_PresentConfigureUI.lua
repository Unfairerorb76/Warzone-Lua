function Client_PresentConfigureUI(rootParent, rootParent2, rootParent3)
	print(1);
	local initialVillages = Mod.Settings.NumOfVillages;
	local OnlyNeutrals = Mod.Settings.ONeutrals;
	local GainedArmies = Mod.Settings.Armies;
	
	if initialVillages == nil then
		initialVillages = 3;
	end
	if OnlyNeutrals == nil then
		OnlyNeutrals = false;
	end
	if GainedArmies == nil then
		GainedArmies = 2;
	end
		
	
    
 local vert = UI.CreateVerticalLayoutGroup(rootParent);
 local horz1 = UI.CreateHorizontalLayoutGroup(vert);  --not used
 local horz2 = UI.CreateHorizontalLayoutGroup(vert);  --not used but here for reference
	
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
                .SetIsChecked(OnlyNeutrals);
	
	
end
