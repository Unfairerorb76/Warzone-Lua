
function Client_PresentSettingsUI(rootParent)
	UI.CreateLabel(rootParent)
		.SetText('amount of neutrals you get for free every turn = ' .. Mod.Settings.NumToConvert);
end

