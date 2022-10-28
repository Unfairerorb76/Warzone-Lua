function Client_PresentSettingsUI(rootParent, game)

local vert = UI.CreateVerticalLayoutGroup(rootParent);	
UI.CreateLabel(vert).SetText('amount of territories(neutrals) you get for free every turn = ' .. Mod.Settings.NumToConvert);
UI.CreateLabel(vert).SetText('amount of armies that come with each new territory = ' .. Mod.Settings.SetArmiesTo);
  
UI.CreateLabel(vert).SetText('amount of villages that spawned = ' .. Mod.Settings.NumOfVillages);
UI.CreateLabel(vert).SetText('amount of armies with each claimed territory = ' .. Mod.Settings.Armies);
  
UI.CreateLabel(vert).SetText('Amount of Army Caches that spawned = ' .. Mod.Settings.NumOfACaches);
UI.CreateLabel(vert).SetText('Amount of Armies with each claimed Cache = ' .. Mod.Settings.Armies);
if (Mod.Settings.FixedArmies == false) then
UI.CreateLabel(vert).SetText('Random +/- limit of: ' .. Mod.Settings.Luck);
end
if (game.Settings.CommerceGame == true) then
UI.CreateLabel(vert).SetText('Amount of gold that a territory costs = ' .. Mod.Settings.terrCost);
end
end
