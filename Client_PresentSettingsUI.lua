function Client_PresentSettingsUI(rootParent)
	local vert = UI.CreateVerticalLayoutGroup(rootParent);

	UI.CreateLabel(vert).SetText('A Diplomat costs: ' .. Mod.Settings.CostToBuyDiplomat);
	UI.CreateLabel(vert).SetText('Max priests: ' .. Mod.Settings.MaxDiplomats);
	UI.CreateLabel(vert).SetText('turns a diplomacy lasts for: ' .. Mod.Settings.turns);,

	UI.CreateLabel(vert).SetText('A Diplomat will always have the same power as 1 army!');
end
