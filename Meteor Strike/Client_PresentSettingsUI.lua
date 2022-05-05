
function Client_PresentSettingsUI(rootParent)
	

local vert = UI.CreateVerticalLayoutGroup(rootParent);	
UI.CreateLabel(vert).SetText('amount of territories that will be hit per turn = ' .. Mod.Settings.NumOfStrikes);
UI.CreateLabel(vert).SetText('amount of armies that will die per hit = ' .. Mod.Settings.ArmiesKilled);

end

