
function Client_PresentConfigureUI(rootParent)
	local initialValue = Mod.Settings.NumToConvert;
	if initialValue == nil then
		initialValue = 2;
	end
    
    local horz = UI.CreateHorizontalLayoutGroup(rootParent);
	UI.CreateLabel(horz).SetText('amount of neutrals a player shall gain each turn');
    numberInputField = UI.CreateNumberInputField(horz)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(10)
		.SetValue(initialValue);

end
