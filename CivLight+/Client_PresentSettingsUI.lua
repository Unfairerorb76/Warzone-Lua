function Client_PresentSettingsUI(rootParent, game)

  local vert = UI.CreateVerticalLayoutGroup(rootParent);	
  --Expansion+ mod related
  UI.CreateLabel(vert).SetText('amount of territories(neutrals) you get for free every turn = ' .. Mod.Settings.NumToConvert);
  UI.CreateLabel(vert).SetText('amount of armies that come with each new territory = ' .. Mod.Settings.SetArmiesTo);
  if (Mod.Settings.initalcheckbox == true) then
    UI.CreateLabel(vert).SetText('the mod will only claim neutrals that are less than or equal to armies on distributed territories');
  end
  --village mod related
  UI.CreateLabel(vert).SetText('amount of villages that spawned = ' .. Mod.Settings.NumOfVillages);
  UI.CreateLabel(vert).SetText('amount of armies with each claimed territory = ' .. Mod.Settings.Armies);
  if (Mod.Settings.ONeutrals == false) then
    UI.CreateLabel(vert).SetText('claimed territories will also take other players');
  end
  --army caches related
  UI.CreateLabel(vert).SetText('Amount of Army Caches that spawned = ' .. Mod.Settings.NumOfACaches);
  UI.CreateLabel(vert).SetText('Amount of Armies with each claimed Cache = ' .. Mod.Settings.Armies);
  if (Mod.Settings.FixedArmies == false) then
    UI.CreateLabel(vert).SetText('Random +/- limit of armies: ' .. Mod.Settings.aLuck);
  end
  
  --card caches related
  UI.CreateLabel(vert).SetText('Amount of Card Caches that spawned = ' .. Mod.Settings.NumOfRCaches);
  UI.CreateLabel(vert).SetText('Amount of card pieces with each claimed Cache = ' .. Mod.Settings.cPieces);
  if Mod.Settings.FixedPieces == false then
  UI.CreateLabel(vert).SetText('Random +/- limit of pieces: ' .. Mod.Settings.rLuck);
  end	

  if Mod.Settings.AttackNeutral == false then
    UI.CreateLabel(vert).SetText('you are unable to take neutrals by yourself, you can damage them though.');
  end	
    
  end
