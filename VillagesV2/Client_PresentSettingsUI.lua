function Client_PresentSettingsUI(rootParent)
	
    local vert = UI.CreateVerticalLayoutGroup(rootParent);	
    UI.CreateLabel(vert).SetText('amount of villages that spawned = ' .. Mod.Settings.NumOfVillages).SetColor('#0000FF');   
    UI.CreateLabel(vert).SetText('amount of armies with each claimed territory = ' .. Mod.Settings.Armies).SetColor('#0000FF');

if (Mod.Settings.ONeutrals == true) then
   UI.CreateLabel(vert).SetText('Villages will only take neutral territories that border it.').SetColor('#0000FF');
else
   UI.CreateLabel(vert).SetText('Villages will take every territory that borders it.').SetColor('#0000FF');
end
--Special Unit Limits	
   UI.CreateLabel(vert).SetText('Limit on Capitalists = ' .. Mod.Settings.CapitalistLimit).SetColor('#AD7E7E');
   UI.CreateLabel(vert).SetText('Limit on Diplomats = ' .. Mod.Settings.DiplomatLimit).SetColor('#AD7E7E');	
   UI.CreateLabel(vert).SetText('Limit on Priests = ' .. Mod.Settings.PriestLimit).SetColor('#AD7E7E');
   UI.CreateLabel(vert).SetText('Limit on Medics = ' .. Mod.Settings.MedicLimit).SetColor('#AD7E7E');
end
