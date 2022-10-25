function Client_PresentSettingsUI(rootParent)

local vert = UI.CreateVerticalLayoutGroup(rootParent);	
UI.CreateLabel(vert).SetText('amount of territories(neutrals) you get for free every turn = ' .. Mod.Settings.NumToConvert);
UI.CreateLabel(vert).SetText('amount of armies that come with each new territory = ' .. Mod.Settings.SetArmiesTo);
  
UI.CreateLabel(vert).SetText('amount of villages that spawned = ' .. Mod.Settings.NumOfVillages);
UI.CreateLabel(vert).SetText('amount of armies with each claimed territory = ' .. Mod.Settings.Armies);
  


end
