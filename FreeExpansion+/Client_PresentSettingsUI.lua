function Client_PresentSettingsUI(rootParent)

local vert = UI.CreateVerticalLayoutGroup(rootParent);	
UI.CreateLabel(vert).SetText('amount of territories(neutrals) you get for free every turn = ' .. Mod.Settings.NumToConvert);
UI.CreateLabel(vert).SetText('amount of armies that come with each new territory = ' .. Mod.Settings.SetArmiesTo);

end
