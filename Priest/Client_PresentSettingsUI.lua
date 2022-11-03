function Client_PresentSettingsUI(rootParent)
	local vert = UI.CreateVerticalLayoutGroup(rootParent);

	UI.CreateLabel(vert).SetText('Priest cost: ' .. Mod.Settings.CostToBuyPriest);
	UI.CreateLabel(vert).SetText('Priest power: ' .. Mod.Settings.PriestPower);
	UI.CreateLabel(vert).SetText('Max priests: ' .. Mod.Settings.MaxPriests);
	UI.CreateLabel(vert).SetText('conversion percentage: ' .. Mod.Settings.Percentage .. '%');
end
