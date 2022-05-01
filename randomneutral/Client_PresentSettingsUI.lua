
function Client_PresentSettingsUI(rootParent)
	print(2);
	UI.CreateLabel(rootParent)
		.SetText('amount of territories(neutrals) you get for free every turn = ' .. Mod.Settings.NumToConvert);
		.SetText('amount of armies that come with each new territory = ' .. Mod.Settings.SetArmiesTo);
		.SetText('Only claim base neutrals = ' .. Mod.Settings.OnlyBaseNeutrals);

local vert = UI.CreateVerticalLayoutGroup(rootParent);	
UI.CreateLabel(vert).SetText('amount of territories(neutrals) you get for free every turn = ' .. Mod.Settings.NumToConvert);
UI.CreateLabel(vert).SetText('amount of armies that come with each new territory = ' .. Mod.Settings.SetArmiesTo
UI.CreateLabel(vert).SetText('Only claim base neutrals = ' .. Mod.Settings.OnlyBaseNeutrals);
end

