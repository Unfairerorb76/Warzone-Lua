function Client_PresentConfigureUI(rootParent, rootParent2, rootParent3)
	print(1);
	local initialVillages = Mod.Settings.NumOfVillages;
	
	if initialVillages == nil then
		initialVillages = 3;
	end
	
    
 local vert = UI.CreateVerticalLayoutGroup(rootParent);
 local horz1 = UI.CreateHorizontalLayoutGroup(vert);  --not used
 local horz2 = UI.CreateHorizontalLayoutGroup(vert);  --not used but here for reference
	
		UI.CreateLabel(vert).SetText('Amount of Villages that will be created at the start of the game');
   	 numberInputField = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(10)
		.SetValue(initialVillages);
       print(2); 
end
