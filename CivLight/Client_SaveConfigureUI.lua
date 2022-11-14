function Client_SaveConfigureUI(alert)
        
        if ExpansionInputField == nil then
         Mod.Settings.NumToConvert = 2;
         Mod.Settings.SetArmiesTo = 2;
         Mod.Settings.OnlyBaseNeutrals = false;
        else
         Mod.Settings.NumToConvert = ExpansionInputField.GetValue();
         Mod.Settings.SetArmiesTo = ExpArmyInputField.GetValue();
         Mod.Settings.OnlyBaseNeutrals = ExpBaseInputField.GetIsChecked();
        end
        
     Mod.Settings.NumOfVillages = villageInputField.GetValue();
    Mod.Settings.Armies = vValueInputField.GetValue();
    Mod.Settings.ONeutrals = ONInputField.GetIsChecked();
    
    Mod.Settings.NumOfACaches = armyCacheInputField.GetValue();
    Mod.Settings.Armies = armyAmountInputField.GetValue();
    Mod.Settings.FixedArmies = fixedArmyInputField.GetIsChecked();
    Mod.Settings.aLuck = randArmyInputField.GetValue();
    
    Mod.Settings.NumOfRCaches = cardCacheInputField.GetValue();
    Mod.Settings.cPieces = PiecesInputField.GetValue();
    Mod.Settings.FixedPieces = fixedPiecesInputField.GetIsChecked();
    Mod.Settings.rLuck = randPiecesInputField.GetValue();

   if attackNeutralInputField == nil then
     Mod.Settings.AttackNeutral = true;
  else
    Mod.Settings.AttackNeutral = attackNeutralInputField.GetIsChecked();
  end    

end
