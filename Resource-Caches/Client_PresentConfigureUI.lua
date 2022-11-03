function Client_PresentConfigureUI(rootParent, rootParent2, rootParent3)
	
	local initialRCaches = Mod.Settings.NumOfRCaches;
	local Pieces = Mod.Settings.cPieces
	
	if initialRCaches == nil then
		initialRCaches = 2;
	end

	if Pieces == nil then
		Pieces = 5;
	end
    
 local vert = UI.CreateVerticalLayoutGroup(rootParent);
 local horz1 = UI.CreateHorizontalLayoutGroup(vert);  --not used
 local horz2 = UI.CreateHorizontalLayoutGroup(vert);  --not used but here for reference
	
		UI.CreateLabel(vert).SetText('Amount of Resource Caches that will spawn at the start of the game');
   	 numberInputField = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(20)
		.SetValue(initialRCaches);
	
	UI.CreateLabel(vert).SetText('Amount of card pieces you will get for claiming a cache');
   	 numberInputField2 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(15)
		.SetValue(Pieces);
	
end
