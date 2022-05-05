
function Client_PresentConfigureUI(rootParent, rootParent2, rootParent3)
	print(1);
	local initialValueStrikes = Mod.Settings.NumOfStrikes;
	local initialValueKilled = Mod.Settings.SetArmiesTo;
        
	
	if initialValueStrikes == nil then
		initialValueStrikes = 5;
	end
	
	if initialValueKilled == nil then
		initialValueKilled = 2;
	end
    
 local vert = UI.CreateVerticalLayoutGroup(rootParent);
local horz1 = UI.CreateHorizontalLayoutGroup(vert);  --not used
local horz2 = UI.CreateHorizontalLayoutGroup(vert);  --not used but here for reference
	
	UI.CreateLabel(vert).SetText('Amount of meteors that will hit per turn');
    numberInputField = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(20)
		.SetValue(initialValueStrikes);
	
	 UI.CreateLabel(vert).SetText('amount of armies that will die per hit');
    numberInputField2 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(15)
		.SetValue(initialValueKilled); 
 
 
                

end
