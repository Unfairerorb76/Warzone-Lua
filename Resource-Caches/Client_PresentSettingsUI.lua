function Client_PresentSettingsUI(rootParent)
	
local vert = UI.CreateVerticalLayoutGroup(rootParent);	
UI.CreateLabel(vert).SetText('Amount of Resource Caches that spawned = ' .. Mod.Settings.NumOfACaches);
UI.CreateLabel(vert).SetText('Amount of card pieces with each claimed Cache = ' .. Mod.Settings.cPieces);
	
end
