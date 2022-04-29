
function Client_PresentSettingsUI(rootParent, rootParent2)
	print(2);
	UI.CreateLabel(rootParent)
		.SetText('amount of territories(neutrals) you get for free every turn = ' .. Mod.Settings.NumToConvert);
	UI.CreateLabel(rootParent2)
		.SetText('amount of armies that come with each new territory = ' .. Mod.Settings.SetArmiesTo);
end

