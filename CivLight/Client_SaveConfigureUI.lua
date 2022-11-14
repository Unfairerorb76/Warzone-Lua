function Client_SaveConfigureUI(alert)
    
    Mod.Settings.NumToConvert = ExpansionInputField.GetValue();
    Mod.Settings.SetArmiesTo = ExpArmyInputField.GetValue();
    Mod.Settings.OnlyBaseNeutrals = ExpBaseInputField.GetIsChecked();
    
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

    Mod.Settings.AttackNeutral = attackNeutralInputField.GetIsChecked();

end
