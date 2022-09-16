function Client_PresentConfigureUI(rootParent, rootParent2, rootParent3)
	print(1);
	local initialACaches = Mod.Settings.NumOfACaches;
	local GainedArmies = Mod.Settings.Armies;
	
	if initialVillages == nil then
		initialACaches = 2;
	end

	if GainedArmies == nil then
		GainedArmies = 5;
	end

    
 local vert = UI.CreateVerticalLayoutGroup(rootParent);
 local horz1 = UI.CreateHorizontalLayoutGroup(vert);  --not used
 local horz2 = UI.CreateHorizontalLayoutGroup(vert);  --not used but here for reference
	
		UI.CreateLabel(vert).SetText('Amount of Army Caches that will spawn at the start of the game');
   	 numberInputField = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(20)
		.SetValue(initialACaches);
	
	UI.CreateLabel(vert).SetText('Amount of armies that you will get for claiming a cache');
   	 numberInputField2 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(15)
		.SetValue(GainedArmies);
	
end
