function Client_PresentSettingsUI(rootParent)
	
    local vert = UI.CreateVerticalLayoutGroup(rootParent);	
    UI.CreateLabel(vert).SetText('amount of villages that spawned = ' .. Mod.Settings.NumOfVillages);
end
