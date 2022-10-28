function Client_SaveConfigureUI(alert)
    
    Mod.Settings.NumToConvert = numberInputField.GetValue();
    Mod.Settings.SetArmiesTo = numberInputField2.GetValue();
    Mod.Settings.OnlyBaseNeutrals = booleanInputField.GetIsChecked();
    
     Mod.Settings.NumOfVillages = numberInputField3.GetValue();
    Mod.Settings.Armies = numberInputField4.GetValue();
    Mod.Settings.ONeutrals = booleanInputField2.GetIsChecked();
    
    Mod.Settings.NumOfACaches = numberInputField5.GetValue();
    Mod.Settings.Armies = numberInputField6.GetValue();
    Mod.Settings.FixedArmies = booleanInputField3.GetIsChecked();
    Mod.Settings.Luck = numberInputField7.GetValue();
    
    Mod.Settings.terrCost = numberInputField8.GetValue();

end
