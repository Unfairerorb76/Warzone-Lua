function Client_PresentSettingsUI(rootParent)
	

local vert = UI.CreateVerticalLayoutGroup(rootParent);	
UI.CreateLabel(vert).SetText('Amount of Army Caches that spawned = ' .. Mod.Settings.NumOfACaches);
UI.CreateLabel(vert).SetText('Amount of armies with each claimed Cache = ' .. Mod.Settings.Armies);
if Mod.Settings.FixedArmies == true then
UI.CreateLabel(vert).SetText('Random +/- limit of:' Mod.Settings.luck);
end	
end
